
//
//  MoveItController.m
//  Navigator
//
//  Created by sysadminAZ on 12/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MoveItController.h"


@implementation MoveItController

@synthesize mList;

- (IBAction)moveButton {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    
    [self.navigationItem.rightBarButtonItem setTitle:(self.tableView.editing)? @"Done" : @"Move"];
}

- (void)viewDidLoad {
    if (mList == nil)
    {
        self.mList = [[NSMutableArray alloc] initWithObjects:@"$1", @"$2", @"$5", @"$10", @"$20", @"$50", @"$100", nil];
    }
	
    UIBarButtonItem *mvButton = [[UIBarButtonItem alloc]
                                 initWithTitle:@"Move" 
                                 style:UIBarButtonItemStyleBordered 
                                 target:self 
                                 action:@selector(moveButton)];
    self.navigationItem.rightBarButtonItem = mvButton;
    [mvButton release];
    [super viewDidLoad];
}

#pragma mark - Table dataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [mList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *moveItCellId = @"moveItCellId";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:moveItCellId];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:moveItCellId] autorelease];
        cell.showsReorderControl = YES;
    }
    
    cell.textLabel.text = [mList objectAtIndex:[indexPath row]];
    return cell;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [mList removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

- (BOOL)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)indexPath
{ return YES; }

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
	  toIndexPath:(NSIndexPath *)toIndexPath {
    
    NSLog(@"from %d, to %d", [fromIndexPath row], [toIndexPath row]);
    id object = [[mList objectAtIndex:[fromIndexPath row]] retain];
    [mList removeObjectAtIndex:[fromIndexPath row]];
    [mList insertObject:object atIndex:[toIndexPath row]];
    [object release];                 
}

- (void) dealloc {
    [mList release];
    [super dealloc];
}


@end
