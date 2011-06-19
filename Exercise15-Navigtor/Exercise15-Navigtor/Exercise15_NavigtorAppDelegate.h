//
//  Exercise15_NavigtorAppDelegate.h
//  Exercise15-Navigtor
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Exercise15_NavigtorAppDelegate : NSObject <UIApplicationDelegate> {
    UINavigationController *mNavigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *mNavigationController;

@end
