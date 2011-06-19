//
//  SwipeyViewController.h
//  Exercise15-Navigtor
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MIN_GESTURE_LENGTH  25
#define MAX_VARIANCE        5

@interface SwipeyViewController : UIViewController {
    UILabel *mLabel;
    CGPoint mGestureStartPoint;
}

@property (nonatomic, retain) IBOutlet UILabel *mLabel;
@property CGPoint mGestureStartPoint;

- (void)erase;

@end
