//
//  Exercise9_TabAppDelegate.h
//  Exercise9-Tab
//
//  Created by Vlad Toader on 6/18/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Exercise9_TabAppDelegate : NSObject <UIApplicationDelegate> {
    UITabBarController *rootController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *rootController;

@end
