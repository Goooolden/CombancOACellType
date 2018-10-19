//
//  ApprovalGroupTableViewCell.m
//  ApplyDemo
//
//  Created by Golden on 2018/9/6.
//  Copyright © 2018年 Golden. All rights reserved.
//

#import "ApprovalGroupTableViewCell.h"
#import "CustomCellDefine.h"
#import "UIColor+CustomCell.h"
#import "Masonry.h"

@interface ApprovalGroupTableViewCell ()

@end

@implementation ApprovalGroupTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
    _nameLabel.textColor = [UIColor colorWithHex:@"#38383d"];
    [self.contentView addSubview:_nameLabel];
    
    _approvalGroupView = [[ApprovalGroupView alloc]init];
    [self.contentView addSubview:_approvalGroupView];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(K_CellLeft+K_CellStarsWidth+K_CellNamelblLeft);
        make.top.equalTo(self.contentView.mas_top).offset(K_CellNamelblTop);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}

@end
