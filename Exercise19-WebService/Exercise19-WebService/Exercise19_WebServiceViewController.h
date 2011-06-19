//
//  Exercise19_WebServiceViewController.h
//  Exercise19-WebService
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListParser.h"

@interface Exercise19_WebServiceViewController : UIViewController {
    UITextView *mTextView;
    NSMutableData *mReceivedData;
}

@property (nonatomic, retain) IBOutlet UITextView *mTextView;
@property (nonatomic, retain) NSMutableData *mReceivedData;

- (IBAction) getButton;

@end
