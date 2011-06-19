//
//  TouchyViewController.h
//  Exercise15-Navigtor
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TouchyViewController : UIViewController {
    UILabel *mMessageLabel, *mTapLabel, *mTouchLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *mMessageLabel, *mTapLabel, *mTouchLabel;

- (void)updateLabelsFromTouch:(NSSet *)touches;

@end
