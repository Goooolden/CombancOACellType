//
//  ApprovalProcessView.m
//  MyApplyDemo
//
//  Created by Golden on 2018/9/19.
//  Copyright © 2018年 Combanc. All rights reserved.
//

#import "ApprovalProcessView.h"
#import "ApprovalProcessViewCell.h"
#import "Masonry.h"
#import "UIColor+CustomCell.h"

@interface ApprovalProcessView()

@property (nonatomic, strong) UILabel *lineLabel;
@property (nonatomic, strong) UIImageView *approvalState;
@property (nonatomic, copy  ) NSArray *approvalers;

@end

@implementation ApprovalProcessView

- (instancetype)initWithFrame:(CGRect)frame withApprovalers:(NSArray *)approvalers{
    if (self = [super initWithFrame:frame]) {
        _approvalers = approvalers;
        [self configUI];
    }
    return self;
}

- (void)configUI {
    self.lineLabel = [[UILabel alloc]init];
    self.lineLabel.backgroundColor = [UIColor colorWithHex:@"#e6e6e6"];
    [self addSubview:self.lineLabel];
    
    self.approvalState = [[UIImageView alloc]init];
    self.approvalState.backgroundColor = [UIColor greenColor];
    self.approvalState.layer.cornerRadius = 6;
    [self addSubview:self.approvalState];
    
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.mas_left).offset(26 + 6);
        make.width.mas_equalTo(1);
    }];
    
    [self.approvalState mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.lineLabel);
        make.width.height.mas_equalTo(12);
    }];
    
    for (int i = 0; i < _approvalers.count; i++) {
        CGFloat x = 56;
        CGFloat h = 44 + 16;
        CGFloat y = h * i;
        CGFloat w = [UIScreen mainScreen].bounds.size.width - x;
        ApprovalProcessViewCell *processCell = [[ApprovalProcessViewCell alloc]initWithFrame:CGRectMake(x, y, w, h)];
        processCell.nameLabel.text = @"王云辉";
        [processCell.departmentLabel setTitle:@"人事部" forState:UIControlStateNormal];
        [self addSubview:processCell];
    }
}

@end
