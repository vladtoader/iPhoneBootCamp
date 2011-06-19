//
//  NiceCell.m
//  Exercise13-Table
//
//  Created by Vlad Toader on 6/18/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import "NiceCell.h"


@implementation NiceCell

@synthesize title, titleColor;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        UIButton *test = [[UIButton alloc] initWithFrame:CGRectMake(200, 0, 40, 40)];
        
        test.backgroundColor = [UIColor redColor];
        [self addSubview:title];
    }
    return self;
}

- (void)changeColor:(UIColor *)color {
    title.backgroundColor = color;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [title release];
    [super dealloc];
}

@end
