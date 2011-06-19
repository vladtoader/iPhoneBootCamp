//
//  PinchyViewController.h
//  Exercise15-Navigtor
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MINIMUM_PINCH 100

@interface PinchyViewController : UIViewController {
    UILabel *mLabel;
    CGFloat mDistance;
}

@property (nonatomic, retain) IBOutlet UILabel *mLabel;
@property CGFloat mDistance;

- (void) erase;
- (CGFloat)distanceBetweenTwoPoints:(CGPoint)fromPoint toPoint:(CGPoint)toPoint;

@end
