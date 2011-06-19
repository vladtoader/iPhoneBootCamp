//
//  PinchyViewController.m
//  Exercise15-Navigtor
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import "PinchyViewController.h"


@implementation PinchyViewController

@synthesize mLabel;
@synthesize mDistance;

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

#pragma mark - Touch delegate methods

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
        else if (currentDistance - mDistance > MINIMUM_PINCH)
        {
            self.mLabel.text = @"out pinch";
            [self performSelector:@selector(erase) withObject:nil afterDelay:1.2f];
        }
        else if (mDistance - currentDistance > MINIMUM_PINCH)
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

@end
