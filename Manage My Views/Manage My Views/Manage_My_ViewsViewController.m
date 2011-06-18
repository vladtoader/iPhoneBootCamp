//
//  Manage_My_ViewsViewController.m
//  Manage My Views
//
//  Created by Vlad Toader on 6/17/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import "Manage_My_ViewsViewController.h"

@implementation Manage_My_ViewsViewController

@synthesize countLabel, mString, mMutableString, mIvarStorage;

- (void)dealloc
{
    [mIvarStorage release];
    [mMutableString release];
    [mString release];
    
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
    self.mMutableString = [[NSMutableString alloc] initWithString:@"a string"];
    self.mString = [[NSString alloc] initWithString:@"another string"];
    self.mIvarStorage = [[NSMutableArray alloc] initWithCapacity:10];
    
    self.countLabel.text = [NSString stringWithFormat:@"%d", [mMutableString retainCount]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Action methods

- (IBAction) retainButtonPressed {
    [self.mIvarStorage addObject:mMutableString];
    [self updateLabel:[mMutableString retainCount]];
}

- (IBAction) releaseButtonPressed {
    if ([mIvarStorage count] > 0) {
        // Allowing this to happen on a count of zero
        // would cause a crash
        [mIvarStorage removeLastObject];
    }
    else {
        UIActionSheet *aSheet = [[UIActionSheet alloc] initWithTitle:@"Warning"
                                                            delegate:self
                                                   cancelButtonTitle:@"Don't do it!"
                                              destructiveButtonTitle:@"Just do it!"
                                                   otherButtonTitles:nil];
        [aSheet showInView:self.view];
        [aSheet release];
    }
    
    [self updateLabel:[mMutableString retainCount]];
}

- (IBAction) resetButtonPressed {
    if ([mIvarStorage count] > 0) {
        [mIvarStorage removeAllObjects];
    }
    [self updateLabel:[mMutableString retainCount]];
}

#pragma mark - UIActionSheetDelegate methods

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"On second thought, I'd better not!");
    }
    if (buttonIndex == 1) {
        NSLog(@"Excellent choice!");
    }
}

- (void) updateLabel:(NSUInteger)count {
    self.countLabel.text = [NSString stringWithFormat:@"%d", count];
}

@end
