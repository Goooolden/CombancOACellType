//
//  ApprovalGroupTableViewCell.h
//  ApplyDemo
//
//  Created by Golden on 2018/9/6.
//  Copyright © 2018年 Golden. All rights reserved.
//  群组选择Cell

#import <UIKit/UIKit.h>
#import "ApprovalGroupView.h"

@interface ApprovalGroupTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) ApprovalGroupView *approvalGroupView;

@end
