//
//  ImageSelectView.h
//  ImagePicker
//
//  Created by Golden on 2018/8/3.
//  Copyright © 2018年 Golden. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^didSelectedImagesBlock)(NSArray *images);

@protocol ImageSelectViewDelegate <NSObject>

@end

@interface ImageSelectView : UIView

@property (nonatomic, weak) UIViewController<ImageSelectViewDelegate> *navDelegate;

/**
 初始化选择图片的界面

 @param frame frame
 @param ArrangeCount 每行显示数量
 @param MaxCount 最多可选择图片数目
 @param cellMaigin 边距
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame
        withCountPerRowInView:(NSInteger)ArrangeCount
           withMaxSelectCount:(NSInteger)MaxCount
                   cellMaigin:(NSInteger)cellMaigin;

- (void)imageSelectViewDidSelected:(didSelectedImagesBlock)didSelectedImages;

@end
