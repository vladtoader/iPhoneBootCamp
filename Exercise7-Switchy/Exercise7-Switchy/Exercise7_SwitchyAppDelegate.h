//
//  Exercise7_SwitchyAppDelegate.h
//  Exercise7-Switchy
//
//  Created by Vlad Toader on 6/17/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwitchViewController;

@interface Exercise7_SwitchyAppDelegate : NSObject <UIApplicationDelegate> {
    SwitchViewController *switchViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SwitchViewController *switchViewController;

@end
