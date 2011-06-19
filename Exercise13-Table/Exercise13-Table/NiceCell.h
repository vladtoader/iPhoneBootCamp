//
//  NiceCell.h
//  Exercise13-Table
//
//  Created by Vlad Toader on 6/18/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NiceCell : UITableViewCell {
    UILabel *title;
    UIColor *titleColor;
}

@property (nonatomic, retain) UILabel *title;
@property (nonatomic, retain) UIColor *titleColor;

-(void)changeColor:(UIColor *)color;

@end
