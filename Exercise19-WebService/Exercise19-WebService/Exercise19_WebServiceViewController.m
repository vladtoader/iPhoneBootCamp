//
//  Exercise19_WebServiceViewController.m
//  Exercise19-WebService
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import "Exercise19_WebServiceViewController.h"

@implementation Exercise19_WebServiceViewController

@synthesize mTextView;
@synthesize mReceivedData;

- (void)dealloc
{
    [mTextView release];
    [mReceivedData release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    mTextView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Connection methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    self.mReceivedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [mReceivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [connection release];
    mReceivedData = nil;
    NSLog(@"error: %@", [error description]);
    self.mTextView.text = @"Connection failed";
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *requestBody = [[NSString alloc] initWithData:mReceivedData encoding:NSUTF8StringEncoding];
    
    ListParser *parser = [ListParser parser];
    [parser addFieldName:@"title"];
    [parser parseData:[requestBody dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSArray *list = [[NSArray alloc] initWithArray:[parser list]];
    
    for(NSString *str in list)
    {
        mTextView.text = [NSString stringWithFormat:@"%@%@\n", mTextView.text, str];
    }
    
//    mTextView.text = [NSString stringWithFormat:@"%@%@\n", mTextView.text, [list objectAtIndex:1]];
//    mTextView.text = [NSString stringWithFormat:@"%@%@\n", mTextView.text, [list objectAtIndex:2]];
    
    [connection release];
    [list release];
    [requestBody release];
    mReceivedData = nil;
}

#pragma mark - Custom methods

- (IBAction) getButton {
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.businessweek.com/rss/bwdaily.rss"]];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (!connection) {
        self.mTextView.text = @"Unable to connect";
    }
    
    [request release];
}

@end
