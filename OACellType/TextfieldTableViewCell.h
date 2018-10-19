//
//  TextfieldTableViewCell.h
//  ApplyDemo
//
//  Created by Golden on 2018/8/20.
//  Copyright © 2018年 Golden. All rights reserved.
//  TextViewCell

#import <UIKit/UIKit.h>

typedef void(^DidEndEditingBlock)(NSString *string);
typedef void(^DidChangeBlock)(void);

@interface TextfieldTableViewCell : UITableViewCell

@property (nonatomic, assign) BOOL isRequired;           //是否为必填项，是否显示必填图标
@property (nonatomic, strong) UILabel *nameLabel;        //左侧sectionName
@property (nonatomic, strong) UITextView *infoTextView;  //右侧TextView

- (void)textViewDidChange:(DidChangeBlock)didChangeBlock withDidEndEditingBlock:(DidEndEditingBlock)didEndEditingBlock;

@end
