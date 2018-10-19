//
//  ChoiceTableViewCell.h
//  ApplyDemo
//
//  Created by Golden on 2018/8/20.
//  Copyright © 2018年 Golden. All rights reserved.
//  单选Cell

#import <UIKit/UIKit.h>

@interface ChoiceTableViewCell : UITableViewCell

@property (nonatomic, assign) BOOL isRequired;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *infoLabel;

@end
