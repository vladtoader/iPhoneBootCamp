//
//  Hi_My_Name_IsAppDelegate.h
//  Hi My Name Is
//
//  Created by Vlad Toader on 6/17/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Hi_My_Name_IsViewController;

@interface Hi_My_Name_IsAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Hi_My_Name_IsViewController *viewController;

@end
