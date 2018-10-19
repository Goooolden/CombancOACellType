//
//  ApplyModel.h
//  ApplyDemo
//
//  Created by Golden on 2018/8/20.
//  Copyright © 2018年 Golden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApplyModel : NSObject

@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *type; /*
                                               1 : 单选
                                               2 : selectTime
                                               3 : cellWithTextView
                                               4 : textView
                                               5 : uploadImage
                                               6 : 审批组
                                               7 ： 流程
                                               8 ： 多选
                                               
                                              */
@property (nonatomic, copy)   NSString *key;
@property (nonatomic, strong) NSArray *selectInfo;

@end

@interface SelectInfoModel : NSObject

@property (nonatomic, copy  ) NSString *type;
@property (nonatomic, strong) NSString *key;

@end
