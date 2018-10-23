//
//  ImageSelectView.m
//  ImagePicker
//
//  Created by Golden on 2018/8/3.
//  Copyright © 2018年 Golden. All rights reserved.
//

#import "ImageSelectView.h"
#import "ImageCollectionViewCell.h"
#import "XLPhotoBrowser.h"
#import "TZImagePickerController.h"

static NSString *const CollectReuseIdentifier = @"CELL_ID";

@interface ImageSelectView ()<
UICollectionViewDelegateFlowLayout,
UICollectionViewDelegate,
UICollectionViewDataSource,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
TZImagePickerControllerDelegate
>

@property (nonatomic, strong) UICollectionView *myCollectionView;
@property (nonatomic, assign) UIEdgeInsets contentInsets;     //edge配置
@property (nonatomic, assign) CGFloat itemWidth;              //itemWidth

@property (nonatomic, assign) NSInteger maxSelectCount;       //最大选择图片数量
@property (nonatomic, assign) NSInteger countPerRowInView;    //每行显示的图片个数
@property (nonatomic, assign) CGFloat margin;                 //cell的间距

@property (nonatomic, strong) NSMutableArray *selectedPhotos; //选择的照片数组
@property (nonatomic, strong) NSMutableArray *selectedAssets; //照片的属性

@property (nonatomic, copy  ) didSelectedImagesBlock didSelectedImageBlock;

@end

@implementation ImageSelectView

- (instancetype)initWithFrame:(CGRect)frame withCountPerRowInView:(NSInteger)ArrangeCount withMaxSelectCount:(NSInteger)MaxCount cellMaigin:(NSInteger)cellMaigin {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        _selectedPhotos = [[NSMutableArray alloc]init];
        _selectedAssets = [[NSMutableArray alloc]init];
        
        _contentInsets = UIEdgeInsetsMake(12, 4, 12, 8);
        _maxSelectCount = 9;
        _countPerRowInView = 5;
        _margin = 4;
        
        if (ArrangeCount) {
            _countPerRowInView = ArrangeCount;
        }
        if (MaxCount) {
            _maxSelectCount = MaxCount;
        }
        if (cellMaigin) {
            _margin = cellMaigin;
            _contentInsets = UIEdgeInsetsMake(10, _margin/2-2, 10, _margin/2+2);
        }
        
        [self configUI];
    }
    return self;
}

- (void)imageSelectViewDidSelected:(didSelectedImagesBlock)didSelectedImages {
    _didSelectedImageBlock = didSelectedImages;
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
    [self.myCollectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:CollectReuseIdentifier];
    [self addSubview:self.myCollectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (_selectedPhotos.count < _maxSelectCount) {
        return _selectedPhotos.count + 1;
    }else {
        return _selectedPhotos.count;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectReuseIdentifier forIndexPath:indexPath];
    if (_selectedPhotos.count < _maxSelectCount) {
        if (indexPath.row == _selectedPhotos.count) {
            [cell.imageView setImage:[UIImage imageNamed:@"OACellTypeResource.bundle/addpictures_img.png"]];
            cell.imageView.layer.cornerRadius = 2;
            cell.deleteBtn.hidden = YES;
        }else {
            cell.imageView.image = _selectedPhotos[indexPath.row];
            cell.imageView.layer.cornerRadius = 0;
            cell.deleteBtn.hidden = NO;
        }
    }else {
        cell.imageView.image = _selectedPhotos[indexPath.row];
        cell.imageView.layer.cornerRadius = 0;
        cell.deleteBtn.hidden = NO;
    }
    cell.deleteBtn.tag = indexPath.row;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _selectedPhotos.count) {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"选择照片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self takePhoto];
        }];
        [alertView addAction:takePhotoAction];
        
        UIAlertAction *pickerAction = [UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self pushImagePickerController];
        }];
        [alertView addAction:pickerAction];
        
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertView addAction:cancleAction];
        [self.navDelegate presentViewController:alertView animated:YES completion:nil];
    }else {
        //预览照片
        [XLPhotoBrowser showPhotoBrowserWithImages:_selectedPhotos currentImageIndex:indexPath.row];
    }
}

#pragma mark - 照相
- (void)takePhoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self.navDelegate presentViewController:picker animated:YES completion:nil];
}

#pragma mark - 照片
- (void)pushImagePickerController {
    if (self.maxSelectCount <= 0) {
        return;
    }else {
        TZImagePickerController *imagePickerVC = [[TZImagePickerController alloc]initWithMaxImagesCount:9 delegate:self];
        imagePickerVC.allowPickingVideo = NO;
        imagePickerVC.allowPickingOriginalPhoto = NO;
        [imagePickerVC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            self->_selectedAssets = [assets mutableCopy];
            self->_selectedPhotos = [photos mutableCopy];
            [self->_myCollectionView reloadData];
            if (self.didSelectedImageBlock) {
                self.didSelectedImageBlock(self.selectedPhotos);
            }
        }];
        [self.navDelegate presentViewController:imagePickerVC animated:YES completion:nil];
    }
}

//获取拍照获得的图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *selectImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (!selectImage) {
        return;
    }else {
        [self->_selectedPhotos addObject:selectImage];
        [self->_myCollectionView reloadData];
        if (self.didSelectedImageBlock) {
            self.didSelectedImageBlock(self.selectedPhotos);
        }
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self.navDelegate dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 删除照片
- (void)deleteBtnClick:(UIButton *)sender {
    [_selectedPhotos removeObjectAtIndex:sender.tag];
    if(_selectedPhotos.count == _maxSelectCount - 1) {
        [_myCollectionView reloadData];
        if (self.didSelectedImageBlock) {
            self.didSelectedImageBlock(self.selectedPhotos);
        }
    }else {
        [_myCollectionView performBatchUpdates:^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
            [self->_myCollectionView deleteItemsAtIndexPaths:@[indexPath]];
        } completion:^(BOOL finished) {
            [self->_myCollectionView reloadData];
            if (self.didSelectedImageBlock) {
                self.didSelectedImageBlock(self.selectedPhotos);
            }
        }];
    }
}

@end
