//
//  ShowImageTableViewCell.m
//  MyApplyDemo
//
//  Created by Golden on 2018/10/23.
//  Copyright © 2018年 Combanc. All rights reserved.
//

#import "ShowImageTableViewCell.h"
#import "Masonry.h"
#import "CustomCellDefine.h"
#import "UIColor+CustomCell.h"

@implementation ShowImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    self.sectionNameLabel = [[UILabel alloc]init];
    self.sectionNameLabel.text = @"相关图片";
    self.sectionNameLabel.textColor = [UIColor colorWithHex:@"#8e8e93"];
    self.sectionNameLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
    [self.contentView addSubview:self.sectionNameLabel];

    self.showPhotoView = [[ShowPhotoView alloc]initWithFrame:CGRectMake(16, K_CellImageGroupTop, K_SCREEN_WIDTH - 20, getHeight(118)) withCountPerRowInView:3 cellMaigin:11 imageArray:@[]];
    [self.contentView addSubview:self.showPhotoView];
    
    [self.sectionNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(getWidth(16));
        make.top.equalTo(self.contentView.mas_top).offset(getHeight(16));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-getHeight(118+20));
    }];
}

- (void)setImageArray:(NSArray *)imageArray {
    [self.showPhotoView showWithImageArray:imageArray];
    NSInteger lines = imageArray.count == 9 ? 3 : (imageArray.count%3 == 0 ? 0 : 1) + imageArray.count/3;
    self.showPhotoView.frame = CGRectMake(16, K_CellImageGroupTop, [UIScreen mainScreen].bounds.size.width - 20, getHeight(120) * lines);
    [self.sectionNameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(- getHeight(120) * lines - 20);
    }];
}

@end

