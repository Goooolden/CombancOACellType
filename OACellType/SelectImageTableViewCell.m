//
//  SelectImageTableViewCell.m
//  ApplyDemo
//
//  Created by Golden on 2018/8/22.
//  Copyright © 2018年 Golden. All rights reserved.
//

#import "SelectImageTableViewCell.h"
#import "CustomCellDefine.h"
#import "UIColor+CustomCell.h"
#import "Masonry.h"

@interface SelectImageTableViewCell()

@end

@implementation SelectImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.text = @"选择照片";
    _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
    _nameLabel.textColor = [UIColor colorWithHex:@"#38383d"];
    [self.contentView addSubview:_nameLabel];
        
    _selectView = [[ImageSelectView alloc]initWithFrame:CGRectMake(10, K_CellImageGroupTop, K_SCREEN_WIDTH - 20, getHeight(118)) withCountPerRowInView:3 withMaxSelectCount:9 cellMaigin:getWidth(11)];
    [self.contentView addSubview:_selectView];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(K_CellLeft+K_CellStarsWidth+K_CellNamelblLeft);
        make.top.equalTo(self.contentView.mas_top).offset(K_CellNamelblTop);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-getHeight(118+20));
    }];
}

@end
