//
//  ShowPhotoView.m
//  MyApplyDemo
//
//  Created by Golden on 2018/10/23.
//  Copyright © 2018年 Combanc. All rights reserved.
//

#import "ShowPhotoView.h"
#import "ShowImageCollectionViewCell.h"
#import "XLPhotoBrowser.h"

static NSString *const CollectReuseIdentifier = @"Cell_ID";

@interface ShowPhotoView ()<
UICollectionViewDelegateFlowLayout,
UICollectionViewDelegate,
UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *myCollectionView;
@property (nonatomic, assign) UIEdgeInsets contentInsets;     //edge配置
@property (nonatomic, assign) CGFloat itemWidth;              //itemWidth
@property (nonatomic, copy  ) NSArray *imageArray;

@property (nonatomic, assign) NSInteger countPerRowInView;    //每行显示的图片个数
@property (nonatomic, assign) CGFloat margin;

@end

@implementation ShowPhotoView

- (instancetype)initWithFrame:(CGRect)frame withCountPerRowInView:(NSInteger)ArrangeCount cellMaigin:(NSInteger)cellMaigin imageArray:(NSArray *)imageArray {
    if (self = [super initWithFrame:frame]) {
        _contentInsets = UIEdgeInsetsMake(12, 4, 12, 8);
        _countPerRowInView = 5;
        _margin = 4;
        _imageArray = imageArray;
        
        if (ArrangeCount) {
            _countPerRowInView = ArrangeCount;
        }
        if (cellMaigin) {
            _margin = cellMaigin;
            _contentInsets = UIEdgeInsetsMake(10, _margin/2-2, 10, _margin/2+2);
        }
        [self configUI];
    }
    return self;
}

- (void)showWithImageArray:(NSArray *)imageArray {
    self.imageArray = imageArray;
    [self.myCollectionView reloadData];
}

- (void)configUI {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _itemWidth = self.frame.size.width / _countPerRowInView - _margin;
    
    flowLayout.itemSize = CGSizeMake(_itemWidth, _itemWidth);
    flowLayout.minimumLineSpacing = _margin;
    flowLayout.minimumInteritemSpacing = _margin;
    
    self.myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flowLayout];
    self.myCollectionView.delegate = self;
    self.myCollectionView.dataSource = self;
    self.myCollectionView.contentInset = _contentInsets;
    self.myCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.myCollectionView.backgroundColor = [UIColor whiteColor];
    self.myCollectionView.scrollEnabled = NO;
    self.myCollectionView.showsVerticalScrollIndicator = NO;
    self.myCollectionView.showsHorizontalScrollIndicator = NO;
    [self.myCollectionView registerClass:[ShowImageCollectionViewCell class] forCellWithReuseIdentifier:CollectReuseIdentifier];
    [self addSubview:self.myCollectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShowImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectReuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [XLPhotoBrowser showPhotoBrowserWithImages:self.imageArray currentImageIndex:indexPath.row];
}

@end
