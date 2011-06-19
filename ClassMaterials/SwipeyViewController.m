//
//  SwipeyViewController.m
//  Navigator
//
//  Created by sysadminAZ on 12/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SwipeyViewController.h"


@implementation SwipeyViewController

@synthesize mLabel;
@synthesize mGestureStartPoint;

-(void)erase
{
	self.mLabel.text = @"";
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	mGestureStartPoint = [touch locationInView:self.view];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint currentPosition = [touch locationInView:self.view];
	
	CGFloat dX = fabs(mGestureStartPoint.x - currentPosition.x);
	CGFloat dY = fabs(mGestureStartPoint.y - currentPosition.y);
	
	if (dX >= MIN_GESTURE_LENGTH && dY <= MAX_VARIANCE) {
		self.mLabel.text = @"Horizontal swipe detected";
		[self performSelector:@selector(erase) withObject:nil afterDelay:2];
	}
	else if (dY >= MIN_GESTURE_LENGTH && dX <= MAX_VARIANCE)
	{
		self.mLabel.text = @"Vertical swipe detected";
		[self performSelector:@selector(erase) withObject:nil afterDelay:2];
	}
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	mLabel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[mLabel release];
    [super dealloc];
}


@end
