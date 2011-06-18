//
//  Manage_My_ViewsViewController.h
//  Manage My Views
//
//  Created by Vlad Toader on 6/17/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Manage_My_ViewsViewController : UIViewController <UIActionSheetDelegate> {
    IBOutlet UILabel *countLabel;
    NSString *mString;
    NSMutableString *mMutableString;
    NSMutableArray *mIvarStorage;
}

@property (nonatomic, retain) IBOutlet UILabel *countLabel;
@property (nonatomic, retain) NSString *mString;
@property (nonatomic, retain) NSMutableString *mMutableString;
@property (nonatomic, retain) NSMutableArray *mIvarStorage;

- (IBAction) retainButtonPressed;
- (IBAction) releaseButtonPressed;
- (IBAction) resetButtonPressed;
- (void) updateLabel:(NSUInteger)count;

@end
