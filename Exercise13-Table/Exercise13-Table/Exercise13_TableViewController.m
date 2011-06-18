//
//  Exercise13_TableViewController.m
//  Exercise13-Table
//
//  Created by Vlad Toader on 6/18/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import "Exercise13_TableViewController.h"

@implementation Exercise13_TableViewController

@synthesize mList;

- (void)dealloc
{
    [mList release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mList = [[NSArray alloc] initWithObjects:@"Windows 3.11", @"Windows 95", @"Windows 98", @"Windows ME", @"Windows NT", @"Windows 2000", @"Windows XP", @"Windows Vista", @"Windows 7", nil];
}

- (void)viewDidUnload
{
    mList = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - TableView DataSource Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [mList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableId = @"tableId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableId];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableId] autorelease];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [mList objectAtIndex:row];
    return cell;
}

@end
