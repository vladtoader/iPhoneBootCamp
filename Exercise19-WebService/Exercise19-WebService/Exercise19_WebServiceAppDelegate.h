//
//  Exercise19_WebServiceAppDelegate.h
//  Exercise19-WebService
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Exercise19_WebServiceViewController;

@interface Exercise19_WebServiceAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Exercise19_WebServiceViewController *viewController;

@end
