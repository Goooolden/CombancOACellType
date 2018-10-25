//
//  ShowPhotoView.h
//  MyApplyDemo
//
//  Created by Golden on 2018/10/23.
//  Copyright © 2018年 Combanc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowPhotoView : UIView

/**
 初始化

 @param frame frame
 @param ArrangeCount 每行显示数量
 @param cellMaigin 边距
 @param imageArray 要显示的imgae数组
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame
        withCountPerRowInView:(NSInteger)ArrangeCount
                   cellMaigin:(NSInteger)cellMaigin
                   imageArray:(NSArray *)imageArray;

- (void)showWithImageArray:(NSArray *)imageArray;

@end
