//
//  SwitchViewController.h
//  Switchy
//
//  Created by sysadminAZ on 12/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BadNewsViewController;
@class GoodNewsViewController;

@interface SwitchViewController : UIViewController {	
	BadNewsViewController *mBadNewsViewController;
	GoodNewsViewController *mGoodNewsViewController;
    UISwipeGestureRecognizer *gest;
}

@property (nonatomic, retain) UISwipeGestureRecognizer *gest;
@property (nonatomic, retain) BadNewsViewController *mBadNewsViewController;
@property (nonatomic, retain) GoodNewsViewController *mGoodNewsViewController;
-(IBAction) switchView:(id)sender;
@end
