//
//  TextViewTableViewCell.m
//  ApplyDemo
//
//  Created by Golden on 2018/8/20.
//  Copyright © 2018年 Golden. All rights reserved.
//

#import "TextViewTableViewCell.h"
#import "Masonry.h"
#import "CustomCellDefine.h"
#import "UIColor+CustomCell.h"

#define WORD_LIMIT 50

@interface TextViewTableViewCell()<UITextViewDelegate>

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, copy  ) DidChangeBlock didChangeBlock;
@property (nonatomic, copy  ) DidEndEditingBlock didEndEditingBlock;
@property (nonatomic, strong) UILabel *limitLabel;

@end

@implementation TextViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    _leftImageView = [[UIImageView alloc]init];
    _leftImageView.image = [UIImage imageNamed:@"OACellTypeResource.bundle/stars.png"];
    [self.contentView addSubview:_leftImageView];
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Medium"size:16];
    _nameLabel.textColor = [UIColor colorWithHex:@"#38383d"];
    [self.contentView addSubview:_nameLabel];
    
    _infoTextView = [[UITextView alloc]init];
    _infoTextView.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
    _infoTextView.textColor = [UIColor colorWithHex:@"#38383d"];
    _infoTextView.delegate = self;
    _infoTextView.scrollEnabled = false;
    [self.contentView addSubview:_infoTextView];
    
    _limitLabel = [[UILabel alloc]init];
    _limitLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
    _limitLabel.textColor = [UIColor colorWithHex:@"#c7c7c7"];
    _limitLabel.text = @"最多输入50个字符";
    [self.contentView addSubview:_limitLabel];
    
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(K_CellLeft);
        make.width.height.mas_equalTo(K_CellStarsWidth);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];

    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImageView.mas_right).offset(K_CellNamelblLeft);
        make.top.equalTo(self.contentView.mas_top).offset(K_CellNamelblTop);
    }];

    [_infoTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(40);
        make.left.equalTo(self.contentView.mas_left).offset(K_CellLeft+K_CellStarsWidth+K_CellNamelblLeft);
        make.right.equalTo(self.contentView.mas_right).offset(-K_CellRight);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-40);
    }];
    
    [_limitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoTextView.mas_bottom).offset(K_CellLimitTop);
        make.right.equalTo(self.contentView.mas_right).offset(-K_CellRight);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-K_CellLimitTop);
    }];
}

- (void)textViewDidChange:(DidChangeBlock)didChangeBlock withDidEndEditingBlock:(DidEndEditingBlock)didEndEditingBlock {
    _didChangeBlock = didChangeBlock;
    _didEndEditingBlock = didEndEditingBlock;
}

- (void)textViewDidChange:(UITextView *)textView {
    //该判断用于联想输入
    if (textView.text.length > WORD_LIMIT) {
        textView.text = [textView.text substringToIndex: WORD_LIMIT];
    }
    if (self.didChangeBlock) {
        self.didChangeBlock();
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (self.didEndEditingBlock) {
        self.didEndEditingBlock(textView.text);
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSString *str = [NSString stringWithFormat:@"%@%@", textView.text, text];
    if (str.length > WORD_LIMIT) {
        textView.text = [textView.text substringToIndex:WORD_LIMIT];
        return NO;
    }
    return YES;
}
@end
