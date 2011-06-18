//
//  CoreLocationViewController.m
//  Exercise9-Tab
//
//  Created by Vlad Toader on 6/18/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import "CoreLocationViewController.h"


@implementation CoreLocationViewController

@synthesize mLat, mLong, mAlt, mVertAcc, mHorzAcc;
@synthesize mStartDistance;
@synthesize mLocationManager;

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
    [mLat release];
    [mLong release];
    [mHorzAcc release];
    [mVertAcc release];
    [mAlt release];
    [mLocationManager release];
    [mStartDistance release];
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
    
    self.mLocationManager = [[CLLocationManager alloc] init];
    self.mLocationManager.delegate = self;
    self.mLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [mLocationManager startUpdatingLocation];
}

- (void)viewDidUnload
{
    self.mLat = nil;
    self.mLong = nil;
    self.mAlt = nil;
    self.mVertAcc = nil;
    self.mHorzAcc = nil;
    [mLocationManager stopUpdatingLocation];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    mLat.text = [NSString stringWithFormat:@"%g", newLocation.coordinate.latitude];
    mLong.text = [NSString stringWithFormat:@"%g", newLocation.coordinate.longitude];
    mAlt.text = [NSString stringWithFormat:@"%g", newLocation.altitude];
    mVertAcc.text = [NSString stringWithFormat:@"%g", newLocation.verticalAccuracy];
    mHorzAcc.text = [NSString stringWithFormat:@"%g", newLocation.horizontalAccuracy];
    
    // the following 2 lines do the exact same thing
    // the first line uses getters & setters (Obj. C 1.0)
    // the second line uses properties (Obj C 2.0) 
    if ([self mStartDistance] == nil) [self setMStartDistance:newLocation];
    if (self.mStartDistance == nil) self.mStartDistance = newLocation;
        
    CLLocationDistance dist = [newLocation distanceFromLocation:mStartDistance];
    NSLog(@"%g", dist);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if ([error code] == kCLErrorLocationUnknown) NSLog(@"unknown error");
    if ([error code] == kCLErrorDenied) NSLog(@"user denied");
    
    [mLocationManager stopUpdatingLocation];
}

@end
