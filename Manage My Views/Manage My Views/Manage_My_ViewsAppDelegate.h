//
//  Manage_My_ViewsAppDelegate.h
//  Manage My Views
//
//  Created by Vlad Toader on 6/17/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Manage_My_ViewsViewController;

@interface Manage_My_ViewsAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Manage_My_ViewsViewController *viewController;

@end
