//
//  SwipeyViewController.m
//  Exercise15-Navigtor
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import "SwipeyViewController.h"

@implementation SwipeyViewController

@synthesize mLabel;
@synthesize mGestureStartPoint;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [mLabel release];
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    mLabel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Custom methods

-(void)erase
{
	self.mLabel.text = @"";
}

#pragma mark - Touches delegate methods

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

@end
