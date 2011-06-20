//
//  AddLocation.m
//  Exercise20-IWasHere
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import "AddLocation.h"
#import "Location.h"
#import "Exercise20_IWasHereAppDelegate.h"


@implementation AddLocation

@synthesize title, dateLbl, addressLbl;
@synthesize locationManager;

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
    [locationManager release];
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
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
}

- (void)viewDidUnload
{
    locationManager = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [locationManager startUpdatingLocation];
}

- (void)viewDidAppear:(BOOL)animated {
}

- (void)viewWillDisappear:(BOOL)animated {
    [locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    latitude = newLocation.coordinate.latitude;
    longitude = newLocation.coordinate.longitude;
    addressLbl.text = [NSString stringWithFormat:@"%d - %d", newLocation.coordinate.latitude, newLocation.coordinate.longitude];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Custom methods

- (IBAction)addLocation {
    NSManagedObjectContext *context = 
                ((Exercise20_IWasHereAppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext;
    
    // @"Location below refers to the name of the entity in CoreData file we created
    Location *newLocation = (Location *)[NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:context];
    
    newLocation.title = title.text;
    newLocation.lon = [NSNumber numberWithDouble:longitude];
    newLocation.lat = [NSNumber numberWithDouble:latitude];
    newLocation.timestamp = [NSDate date];

    NSError *err = nil;
    [context save:&err];
    
    if (err) {
        NSLog(@"%@", err);
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Location added successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

@end
