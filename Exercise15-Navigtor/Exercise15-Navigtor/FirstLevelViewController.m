//
//  FirstLevelViewController.m
//  Exercise15-Navigtor
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import "FirstLevelViewController.h"
#import "SecondLevelViewController.h"

@implementation FirstLevelViewController
@synthesize mControllers;

- (void)viewDidLoad {
    self.title = @"First Level";
    self.mControllers = [[NSMutableArray alloc] init];
    
    [super viewDidLoad];
}

- (void)viewDidUnload {
    mControllers = nil;
    [super viewDidUnload];
}

- (void)dealloc {
    [mControllers release];
    [super dealloc];
}

#pragma mark - Table datasource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [mControllers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *firstLevelCellId = @"firstLevelCellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:firstLevelCellId];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:firstLevelCellId] autorelease];
    }
    
    SecondLevelViewController *controller = [mControllers objectAtIndex:[indexPath row]];
    cell.textLabel.text = controller.title;
    
    return cell;
}

#pragma mark - Table View Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondLevelViewController *nextController = [mControllers objectAtIndex:[indexPath row]];
    [self.navigationController pushViewController:nextController animated:YES];
}

@end
