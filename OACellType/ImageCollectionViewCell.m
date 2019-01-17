//
//  ImageCollectionViewCell.m
//  ImagePicker
//
//  Created by Golden on 2018/8/3.
//  Copyright © 2018年 Golden. All rights reserved.
//

#import "ImageCollectionViewCell.h"
#import "Masonry.h"

@implementation ImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    self.imageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.imageView];
    
    self.deleteBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.deleteBtn.layer.masksToBounds = YES;
    self.deleteBtn.layer.cornerRadius = 10;
    [self.deleteBtn setBackgroundImage:[UIImage imageNamed:@"OACellTypeResource.bundle/icon_delete.png"] forState:UIControlStateNormal
     ];
    [self.contentView addSubview:self.deleteBtn];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_top);
        make.right.equalTo(self.imageView.mas_right);
        make.width.height.mas_offset(20);
    }];    
}

@end
