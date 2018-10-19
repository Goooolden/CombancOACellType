//
//  TextfieldTableViewCell.m
//  ApplyDemo
//
//  Created by Golden on 2018/8/20.
//  Copyright © 2018年 Golden. All rights reserved.
//

#import "TextfieldTableViewCell.h"
#import "Masonry.h"
#import "CustomCellDefine.h"
#import "UIColor+CustomCell.h"
#import "UITextView+Placeholder.h"

@interface TextfieldTableViewCell()<UITextViewDelegate>

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, copy  ) DidEndEditingBlock didEndEditBlock; //编辑完成返回数据Block
@property (nonatomic, copy  ) DidChangeBlock didChangeBlock; //编辑完成返回数据Block

@end

@implementation TextfieldTableViewCell

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
    
    _infoTextView = [[UITextView alloc]init];
    _infoTextView.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
    _infoTextView.textColor = [UIColor colorWithHex:@"#c7c7c7"];
    _infoTextView.delegate = self;
    _infoTextView.scrollEnabled = false;
    _infoTextView.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_infoTextView];
    
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(K_CellLeft);
        make.width.height.mas_equalTo(K_CellStarsWidth);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImageView.mas_right).offset(K_CellNamelblLeft);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [_infoTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(50);
        make.right.equalTo(self.contentView.mas_right).offset(-K_CellRight);
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
    }];
}

- (void)textViewDidChange:(DidChangeBlock)didChangeBlock withDidEndEditingBlock:(DidEndEditingBlock)didEndEditingBlock {
    _didChangeBlock = didChangeBlock;
    _didEndEditBlock = didEndEditingBlock;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (self.didEndEditBlock) {
        self.didEndEditBlock(textView.text);
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    if (self.didChangeBlock) {
        self.didChangeBlock();
    }
}

@end
