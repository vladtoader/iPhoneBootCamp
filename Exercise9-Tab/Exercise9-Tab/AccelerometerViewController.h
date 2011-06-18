//
//  AccelerometerViewController.h
//  Exercise9-Tab
//
//  Created by Vlad Toader on 6/18/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AccelerometerViewController : UIViewController <UIAccelerometerDelegate> {
    UILabel *xLabel, *yLabel, *zLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *xLabel, *yLabel, *zLabel;

@end