//
//  ApprovalProcessCell.m
//  MyApplyDemo
//
//  Created by Golden on 2018/9/19.
//  Copyright © 2018年 Combanc. All rights reserved.
//

#import "ApprovalProcessViewCell.h"
#import "Masonry.h"
#import "UIColor+CustomCell.h"

@implementation ApprovalProcessViewCell

- (instancetype)init {
    if (self = [super init]) {
        [self configUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    self.headerImageView = [[UIImageView alloc]init];
    self.headerImageView.layer.cornerRadius = 22;
    [self.headerImageView setImage:[UIImage imageNamed:@"user"]];
    [self addSubview:self.headerImageView];
    
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
    self.nameLabel.textColor = [UIColor colorWithHex:@"#38383d"];
    [self addSubview:self.nameLabel];
    
    self.departmentLabel = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.departmentLabel setTitleColor:[UIColor colorWithHex:@"#007aff"] forState:UIControlStateNormal];
    self.departmentLabel.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:12];
    self.departmentLabel.backgroundColor = [[UIColor colorWithHex:@"#007aff"] colorWithAlphaComponent:0.3];
    self.departmentLabel.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    self.departmentLabel.layer.cornerRadius = 15;
    [self addSubview:self.departmentLabel];
    
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left);
        make.width.height.mas_equalTo(44);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.headerImageView.mas_right).offset(6);
    }];
    
    [self.departmentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-16);
        make.centerY.equalTo(self.mas_centerY);
        make.width.mas_equalTo(60);
    }];
}

@end
