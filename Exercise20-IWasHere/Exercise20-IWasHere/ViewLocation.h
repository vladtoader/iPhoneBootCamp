//
//  ViewLocation.h
//  Exercise20-IWasHere
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface ViewLocation : UIViewController {
    MKMapView *map;
}

@property (nonatomic, retain) IBOutlet MKMapView *map;

@end
