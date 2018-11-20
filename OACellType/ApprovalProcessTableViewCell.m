//
//  ApprovalProcessTableViewCell.m
//  MyApplyDemo
//
//  Created by Golden on 2018/9/19.
//  Copyright © 2018年 Combanc. All rights reserved.
//

#import "ApprovalProcessTableViewCell.h"
#import "Masonry.h"
#import "UIColor+CustomCell.h"
#import "ApprovalProcessView.h"

@interface ApprovalProcessTableViewCell()

@property (nonatomic, strong) UILabel *sectionNameLbl;
@property (nonatomic, strong) UILabel *topLineLbl;
@property (nonatomic, strong) UILabel *bottomLineLbl;
@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, copy  ) NSArray *approvals;
@property (nonatomic, copy  ) NSArray *department;

@end

@implementation ApprovalProcessTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        [self configUI];
    }
    return self;
}

- (void)configUIWithApprovals:(NSArray *)approvals departments:(NSArray *)department {
    self.approvals = approvals;
    self.department = department;
    self.cellHeight = 0;
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    [self configUI];
}

- (void)configUI {
    self.sectionNameLbl = [[UILabel alloc]init];
    self.sectionNameLbl.text = @"审批流程";
    [self.contentView addSubview:self.sectionNameLbl];
    [self.sectionNameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(26);
        make.top.equalTo(self.contentView.mas_top).offset(14);
    }];
    
    self.topLineLbl = [[UILabel alloc]init];
    self.topLineLbl.backgroundColor = [UIColor colorWithHex:@"#e6e6e6"];
    [self.contentView addSubview:self.topLineLbl];
    [self.topLineLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sectionNameLbl.mas_bottom).offset(14);
        make.left.right.equalTo(self.contentView);
        make.height.mas_offset(1);
    }];
    
    for (int i = 0; i < self.approvals.count; i++) {
        NSArray *array = self.approvals[i];
        CGFloat x = 0;
        CGFloat y = self.cellHeight + 50;
        CGFloat w = [UIScreen mainScreen].bounds.size.height;
        CGFloat h = 60 * array.count;
        ApprovalProcessView *processView = [[ApprovalProcessView alloc]initWithFrame:CGRectMake(x, y, w, h) withApprovalers:array withDepartments:self.department[i]];
        [self.contentView addSubview:processView];
        
        if (self.cellHeight > 0) {
            UILabel *bottomLine = [[UILabel alloc]initWithFrame:CGRectMake(0, y, w, 1)];
            bottomLine.backgroundColor = [UIColor colorWithHex:@"#e6e6e6"];
            [self.contentView addSubview:bottomLine];
        }

        self.cellHeight += h;
    }
    
    self.bottomLineLbl = [[UILabel alloc]init];
    self.bottomLineLbl.textColor = [UIColor colorWithHex:@"#e6e6e6"];
    [self.contentView addSubview:self.bottomLineLbl];
    [self.bottomLineLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(self->_cellHeight + 50);
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
    }];
}

@end
