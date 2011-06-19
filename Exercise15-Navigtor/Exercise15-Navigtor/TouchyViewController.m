//
//  TouchyViewController.m
//  Exercise15-Navigtor
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import "TouchyViewController.h"


@implementation TouchyViewController

@synthesize mTapLabel, mTouchLabel, mMessageLabel;

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
    [mMessageLabel release];
	[mTapLabel release];
	[mTouchLabel release];
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
    mTapLabel = nil;
	mTouchLabel = nil;
	mMessageLabel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - touches methods

-(void) updateLabelsFromTouch:(NSSet *)touches
{
	NSUInteger taps = [[touches anyObject] tapCount];
	NSString *tapsMessage = [[NSString alloc] initWithFormat:@"%d taps detected", taps];
	self.mTapLabel.text = tapsMessage;
	[tapsMessage release];
	
	NSUInteger tmpTouches = [touches count];
	NSString *touchMessage = [[NSString alloc] initWithFormat:@"%d touches detected", tmpTouches];
	self.mTouchLabel.text = touchMessage;
	[touchMessage release];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.mMessageLabel.text = @"touchesBegan";
    [self updateLabelsFromTouch:touches];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    self.mMessageLabel.text = @"touchesCanceled";
    [self updateLabelsFromTouch:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.mMessageLabel.text = @"touchesEnded";
    [self updateLabelsFromTouch:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    self.mMessageLabel.text = @"touchesMoved / drag";
    [self updateLabelsFromTouch:touches];
}

@end
