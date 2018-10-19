//
//  SelectImageTableViewCell.h
//  ApplyDemo
//
//  Created by Golden on 2018/8/22.
//  Copyright © 2018年 Golden. All rights reserved.
//  图片选择Cell

/*
  选择完图片后，需要调用
  [cell.selectView imageSelectViewDidSelected:^(NSArray *images) {}];回调，
  更新cell的高度
  然后在回调中[tableView reload];
 */

#import <UIKit/UIKit.h>
#import "ImageSelectView.h"

@interface SelectImageTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) ImageSelectView *selectView;

@end
