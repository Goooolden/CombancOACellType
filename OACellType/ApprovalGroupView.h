//
//  ApprovalGroupView.h
//  ApplyDemo
//
//  Created by Golden on 2018/9/6.
//  Copyright © 2018年 Golden. All rights reserved.
//  群组选择

#import <UIKit/UIKit.h>
#import "ApplyModel.h"

typedef void(^updateFrameBlock)(void);
typedef void(^SelectedInfoBlock)(NSString *typeID);

@interface ApprovalGroupView : UIView

- (instancetype)initWithFrame:(CGRect)frame approvalGroupInfo:(NSArray<SelectInfoModel *>*)modelArray selectedInfo:(SelectedInfoBlock)selectedBlock;

- (void)approvalGroupInfo:(NSArray<SelectInfoModel *>*)modelArray updateFrameBlock:(updateFrameBlock)updateFrameBlock selectedInfo:(SelectedInfoBlock)selectedBlock;

@end
