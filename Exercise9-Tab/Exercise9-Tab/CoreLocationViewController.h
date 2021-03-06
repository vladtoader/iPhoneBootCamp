//
//  CoreLocationViewController.h
//  Exercise9-Tab
//
//  Created by Vlad Toader on 6/18/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface CoreLocationViewController : UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *mLocationManager;
    CLLocation *mStartDistance;
    
    IBOutlet UILabel *mLat, *mLong, *mAlt, *mVertAcc, *mHorzAcc;
    IBOutlet MKMapView *map;
}

@property (nonatomic, retain) IBOutlet UILabel *mLat, *mLong, *mAlt, *mVertAcc, *mHorzAcc;
@property (nonatomic, retain) CLLocation *mStartDistance;
@property (nonatomic, retain) CLLocationManager *mLocationManager;
@property (nonatomic, retain) MKMapView *map;

@end
