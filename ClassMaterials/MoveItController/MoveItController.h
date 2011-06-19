//
//  MoveItController.h
//  Navigator
//
//  Created by sysadminAZ on 12/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"

@interface MoveItController : SecondLevelViewController {
	NSMutableArray *mList;
}

@property (nonatomic, retain) NSMutableArray *mList;

-(IBAction) moveButton;

@end
