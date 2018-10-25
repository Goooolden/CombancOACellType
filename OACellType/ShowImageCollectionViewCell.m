//
//  ImageCollectionViewCell.m
//  ImagePicker
//
//  Created by Golden on 2018/8/3.
//  Copyright © 2018年 Golden. All rights reserved.
//

#import "ShowImageCollectionViewCell.h"
#import "Masonry.h"

@implementation ShowImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    self.imageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.imageView];

    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

@end
