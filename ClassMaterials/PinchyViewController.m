//
//  PinchyViewController.m
//  Navigator
//
//  Created by sysadminAZ on 12/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PinchyViewController.h"


@implementation PinchyViewController

@synthesize mLabel;
@synthesize mDistance;

-(void) erase
{
		self.mLabel.text = @"";
}

-(float)distanceBetweenTwoPoints:(CGPoint)fromPoint toPoint:(CGPoint)toPoint
{
	float xDist = fromPoint.x - toPoint.x;
	float yDist = fromPoint.y - toPoint.y;
	
	float result = sqrt(pow(xDist, 2) + pow(yDist, 2));
	return result;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
		if ([touches count] == 2) {
			UITouch *firstTouch = [[touches allObjects] objectAtIndex:0];
			UITouch *secondTouch = [[touches allObjects] objectAtIndex:1];
			
			self.mDistance = [self distanceBetweenTwoPoints:[firstTouch locationInView:self.view] toPoint:[secondTouch locationInView:self.view]];
			
		}
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"we moved");
		if ([touches count] == 2) {
			UITouch *firstTouch = [[touches allObjects] objectAtIndex:0];
			UITouch *secondTouch = [[touches allObjects] objectAtIndex:1];
			
			CGFloat currentDistance = [self distanceBetweenTwoPoints:[firstTouch locationInView:self.view] toPoint:[secondTouch locationInView:self.view]];
			
			if (mDistance == 0) {
				self.mDistance = currentDistance;	
			}
			else if (currentDistance - mDistance > MIN_PINCH)
			{
				self.mLabel.text = @"out pinch";
				[self performSelector:@selector(erase) withObject:nil afterDelay:1.2f];
			}
			else if (mDistance - currentDistance > MIN_PINCH)
			{
					self.mLabel.text = @"in pinch";
				[self performSelector:@selector(erase) withObject:nil afterDelay:1.2f];
			}
			
		}
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	self.mDistance = 0;
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
