//
//  Parser.m
//  ttrack
//
//  Created by Edward Patel on 2009-10-11.
//  Copyright 2009 Memention AB. All rights reserved.
//

#import "ListParser.h"


@implementation ListParser

@synthesize filedNames;

+ (ListParser*)parser
{
	return [[[ListParser alloc] init] autorelease];
}

- (id)init
{
	if (self = [super init]) {
		list = [[NSMutableArray alloc] init];
		fieldNames = [[NSMutableArray alloc] init];
        attributeNames = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc
{
	if (activeText)
		[activeText release];
	[list release];
	[fieldNames release];
	[super dealloc];
}

- (NSArray*)list
{
	return [NSArray arrayWithArray:list];
}

- (int)numEntries
{
	return list.count;
}

- (void)parseData:(NSData*)data
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    [parser setDelegate:self];
    [parser parse];
    [parser release];
}

- (void)parseString:(NSString*)string
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:[string dataUsingEncoding:NSUTF8StringEncoding]];
    [parser setDelegate:self];
    [parser parse];
    [parser release];
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName
	 attributes:(NSDictionary *)attributeDict
{
	if (activeText)
		[activeText release];
	activeText = nil;
    if ([fieldNames containsObject:elementName]) {
		activeText = [[NSMutableString alloc] init];
    }

    // Ben Sgro
    // I added this to account for attributes
    // and it works, heh.
    unsigned count = [attributeNames count];
    while (count--) 
    {
        if ([attributeDict objectForKey:[attributeNames objectAtIndex:count]])
        {
            [list addObject:[attributeDict valueForKey:[attributeNames objectAtIndex:count]]];
        }
    }

}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    if ([fieldNames containsObject:elementName]) {
		if (activeText) {
			[list addObject:activeText];
			[activeText release];
			activeText = nil;
		}
    }
}

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string
{
	if (activeText)
		[activeText appendString:string];
}

- (void)addFieldName:(NSString*)name
{
	[fieldNames addObject:[NSString stringWithString:name]];
}

// Ben Sgro
// Added for attributes
- (void)addAttributeName:(NSString *)name
{
    [attributeNames addObject:[NSString stringWithString:name]];
}

@end