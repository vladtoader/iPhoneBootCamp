//
//  SoundViewController.m
//  Exercise9-Tab
//
//  Created by Vlad Toader on 6/18/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import "SoundViewController.h"


@implementation SoundViewController

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
    AudioServicesDisposeSystemSoundID(mShakeSoundId);
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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shaker" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((CFURLRef) [NSURL fileURLWithPath:path], &mShakeSoundId);
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Action methods

- (IBAction) playShake {
    AudioServicesPlaySystemSound(mShakeSoundId);
}

- (IBAction) vibrate {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
