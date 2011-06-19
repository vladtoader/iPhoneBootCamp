//
//  FirstLevelViewController.h
//  Exercise15-Navigtor
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FirstLevelViewController : UITableViewController {
    NSMutableArray *mControllers;
}

@property (nonatomic, retain) NSMutableArray *mControllers;

@end
