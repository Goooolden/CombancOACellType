//
//  ApprovalProcessView.h
//  MyApplyDemo
//
//  Created by Golden on 2018/9/19.
//  Copyright © 2018年 Combanc. All rights reserved.
//  审批流程View

#import <UIKit/UIKit.h>

@interface ApprovalProcessView : UIView

- (instancetype)initWithFrame:(CGRect)frame withApprovalers:(NSArray *)approvalers withDepartments:(NSArray *)departments;

@end
