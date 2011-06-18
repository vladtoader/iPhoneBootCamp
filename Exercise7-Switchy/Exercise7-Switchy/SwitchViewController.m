//
//  SwitchViewController.m
//  Switchy
//
//  Created by sysadminAZ on 12/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SwitchViewController.h"
#import "BadNewsViewController.h"
#import "GoodNewsViewController.h"

@implementation SwitchViewController

@synthesize mBadNewsViewController;
@synthesize mGoodNewsViewController;
@synthesize gest;

// The designated initializer.  Override if you create the controller programatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    gest = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(switchView:)];
    gest.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:gest];
    [gest release];
	
	BadNewsViewController *badController = [[BadNewsViewController alloc] initWithNibName:@"BadNewsView" bundle:nil];
	self.mBadNewsViewController = badController;
	//[self.view insertSubview:badController.view atIndex:0];
	[badController release];
	
	[super viewDidLoad];
}

-(IBAction) switchView:(id)sender
{
    [UIView beginAnimations:@"ViewFlip" context:nil];
    [UIView setAnimationDuration:0.55];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
	if (self.mGoodNewsViewController.view.superview == nil) {
		if (self.mGoodNewsViewController == nil) {
			GoodNewsViewController *goodController = [[GoodNewsViewController alloc] initWithNibName:@"GoodNewsView" bundle:nil];
			self.mGoodNewsViewController = goodController;
			[goodController release];
        }
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
        
        [mBadNewsViewController.view removeFromSuperview];
        [self.view insertSubview:self.mGoodNewsViewController.view atIndex:0];
    }
    else {
        if (self.mBadNewsViewController == nil) {
            BadNewsViewController *badController = [[BadNewsViewController alloc] initWithNibName:@"BadNewsView" bundle:nil];
            self.mBadNewsViewController = badController;
            [badController release];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
        
        [mGoodNewsViewController.view removeFromSuperview];
        [self.view insertSubview:self.mBadNewsViewController.view atIndex:0];
    }
    
    [UIView commitAnimations];
}


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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[mBadNewsViewController release];
	[mGoodNewsViewController release];
    [super dealloc];
}


@end
