//
//  Exercise13_TableViewController.h
//  Exercise13-Table
//
//  Created by Vlad Toader on 6/18/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NiceCell;

@interface Exercise13_TableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *mList;
}

@property (nonatomic, retain) NSArray *mList;

@end
