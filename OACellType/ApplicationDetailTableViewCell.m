//
//  ApplicationDetailTableViewCell.m
//  MyApplyDemo
//
//  Created by Golden on 2018/9/13.
//  Copyright © 2018年 Combanc. All rights reserved.
//

#import "ApplicationDetailTableViewCell.h"
#import "Masonry.h"
#import "UIColor+CustomCell.h"
#import "CustomCellDefine.h"

@implementation ApplicationDetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.textColor = [UIColor colorWithHex:@"#8e8e93"];
    self.nameLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
    [self.contentView addSubview:self.nameLabel];
    
    self.infoLabel = [[UILabel alloc]init];
    self.infoLabel.textColor = [UIColor colorWithHex:@"#38383d"];
    self.infoLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
    self.infoLabel.numberOfLines = 0;
    [self.contentView addSubview:self.infoLabel];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(getHeight(16));
        make.left.equalTo(self.contentView.mas_left).offset(getWidth(16));
        make.width.mas_offset(getWidth(60));
    }];
    
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(getHeight(16));
        make.left.equalTo(self.nameLabel.mas_right).offset(getWidth(10));
        make.right.equalTo(self.contentView.mas_right).offset(getWidth(-16));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(getHeight(-16));
    }];
}

@end
