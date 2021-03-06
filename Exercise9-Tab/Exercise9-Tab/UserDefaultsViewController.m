//
//  UserDefaultsViewController.m
//  Exercise9-Tab
//
//  Created by Vlad Toader on 6/18/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import "UserDefaultsViewController.h"


@implementation UserDefaultsViewController

@synthesize enteredText, def;

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
    [enteredText release];
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
    
    def = [NSUserDefaults standardUserDefaults];
    
    NSString *tempValue = [def stringForKey:@"key1"];
    if (tempValue != nil) {
        enteredText.text = tempValue;
    }
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

- (IBAction)saveData:(id)sender {
    
    def = [NSUserDefaults standardUserDefaults];
    
//    NSLog(@"%@", [def stringForKey:@"key1"]);
    
    [def setObject:[enteredText text] forKey:@"key1"];
    [def synchronize];
}

#pragma mark - UITextFieldDelegate methods

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
