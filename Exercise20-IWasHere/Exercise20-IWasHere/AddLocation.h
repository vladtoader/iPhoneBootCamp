//
//  AddLocation.h
//  Exercise20-IWasHere
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface AddLocation : UIViewController <CLLocationManagerDelegate> {
    UITextField *title;
    UILabel *dateLbl, *addressLbl;
    CLLocationManager *locationManager;
    double latitude;
    double longitude;
}

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) IBOutlet UITextField *title;
@property (nonatomic, retain) IBOutlet UILabel *dateLbl;
@property (nonatomic, retain) IBOutlet UILabel *addressLbl;

- (IBAction)addLocation;

@end
