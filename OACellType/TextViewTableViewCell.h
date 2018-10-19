//
//  TextViewTableViewCell.h
//  ApplyDemo
//
//  Created by Golden on 2018/8/20.
//  Copyright © 2018年 Golden. All rights reserved.
//  TextViewCell

#import <UIKit/UIKit.h>

typedef void(^DidChangeBlock)(void);
typedef void(^DidEndEditingBlock)(NSString *string);

@interface TextViewTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UITextView *infoTextView;

- (void)textViewDidChange:(DidChangeBlock)didChangeBlock withDidEndEditingBlock:(DidEndEditingBlock)didEndEditingBlock;

@end
