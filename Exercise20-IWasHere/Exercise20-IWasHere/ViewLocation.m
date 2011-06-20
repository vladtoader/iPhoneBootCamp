//
//  ViewLocation.m
//  Exercise20-IWasHere
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import "ViewLocation.h"
#import "Exercise20_IWasHereAppDelegate.h"
#import "Location.h"


@implementation ViewLocation

@synthesize map;

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
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated {
    NSManagedObjectContext *context = 
    ((Exercise20_IWasHereAppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext;

    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Location" inManagedObjectContext:context];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timestamp" ascending:NO];
    
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    [sortDescriptor release];
    
    NSError *err = nil;
    NSArray *searchResults = [context executeFetchRequest:fetchRequest error:&err];
    [fetchRequest release];
    
    if (err) {
        NSLog(@"%@",err);
    }
    else
    {
        if([searchResults count] > 0)
        {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"h:mm:ss"];
            
            if ([searchResults count] > 0) {
                Location *lastLoc = [searchResults objectAtIndex:0];
                MKCoordinateRegion mapReg = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake([lastLoc.lat doubleValue],[lastLoc.lon doubleValue]), 500, 500);
                [map setRegion:mapReg];
            }
            
            for (Location *tempLoc in searchResults) {
                MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
                point.coordinate = CLLocationCoordinate2DMake([tempLoc.lat doubleValue], [tempLoc.lon doubleValue]);
                point.title = tempLoc.title;
                point.subtitle = [dateFormatter stringFromDate:tempLoc.timestamp];
                [map addAnnotation:point];
                [point release];
            }
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Data" message:@"No locations have been found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

@end
