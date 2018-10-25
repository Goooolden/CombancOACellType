//
//  ShowImageTableViewCell.h
//  MyApplyDemo
//
//  Created by Golden on 2018/10/23.
//  Copyright © 2018年 Combanc. All rights reserved.
//  我的申请查看图片cell

#import <UIKit/UIKit.h>
#import "ShowPhotoView.h"

@interface ShowImageTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *sectionNameLabel;
@property (nonatomic, strong) ShowPhotoView *showPhotoView;
@property (nonatomic, strong) NSArray *imageArray;

@end
