//
//  ChoiceTableViewCell.m
//  ApplyDemo
//
//  Created by Golden on 2018/8/20.
//  Copyright © 2018年 Golden. All rights reserved.
//

#import "ChoiceTableViewCell.h"
#import "CustomCellDefine.h"
#import "UIColor+CustomCell.h"
#import "Masonry.h"

@interface ChoiceTableViewCell ()

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *rightImageView;

@end

@implementation ChoiceTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    _leftImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_leftImageView];
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Medium"size:16];
    _nameLabel.textColor = [UIColor colorWithHex:@"#38383d"];
    [self.contentView addSubview:_nameLabel];
    
    _infoLabel = [[UILabel alloc]init];
    _infoLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
    _infoLabel.textColor = [UIColor colorWithHex:@"#c7c7c7"];
    _infoLabel.numberOfLines = 0;
    _infoLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_infoLabel];
    
    _rightImageView = [[UIImageView alloc]init];
    [_rightImageView setImage:[UIImage imageNamed:@"repair_default_holo_spn"]];
    [self.contentView addSubview:_rightImageView];
    
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(K_CellLeft);
        make.width.height.mas_equalTo(K_CellStarsWidth);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImageView.mas_right).offset(K_CellNamelblLeft);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
//        make.height.mas_equalTo(44);
//        make.top.equalTo(self.contentView);
    }];
    
    [_infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(200);
        make.right.equalTo(self.rightImageView.mas_left).offset(-K_CellNamelblLeft);
//        make.centerY.equalTo(self.contentView.mas_centerY);
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-K_CellRight);
        make.width.height.mas_offset(K_CellRightImgWidth);
    }];
}

- (void)setIsRequired:(BOOL)isRequired {
    _leftImageView.image = isRequired == YES ? [UIImage imageNamed:@"stars.png"] : nil;
}

@end
