//
//  Register.m
//  Hi My Name Is
//
//  Created by Vlad Toader on 6/17/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import "Register.h"


@implementation Register

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(id) initWithName:(NSString *) name {
    if (self == [super init]) {
        mName = name;
    }
    return self;
}

-(NSUInteger) getCharacterCount:(NSString *) name {
    return [name length];
}

-(void) printName {
    NSLog(@"Name = %@", mName);
}

- (void)dealloc
{
    [mName release];
    [super dealloc];
}

@end
