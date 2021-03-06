//
//  UserDefaultsViewController.h
//  Exercise9-Tab
//
//  Created by Vlad Toader on 6/18/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UserDefaultsViewController : UIViewController <UITextFieldDelegate> {
    UITextField *enteredText;
    NSUserDefaults *def;
}

@property (nonatomic, retain) IBOutlet UITextField *enteredText;
@property (nonatomic, retain) NSUserDefaults *def;

- (IBAction)saveData:(id)sender;

@end
