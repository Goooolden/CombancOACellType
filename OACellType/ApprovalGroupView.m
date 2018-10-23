//
//  ApprovalGroupView.m
//  ApplyDemo
//
//  Created by Golden on 2018/9/6.
//  Copyright © 2018年 Golden. All rights reserved.
//

#import "ApprovalGroupView.h"
#import "CustomCellDefine.h"

@interface ApprovalGroupView ()

@property (nonatomic, strong) UIButton *selectedBtn;
@property (nonatomic, copy  ) updateFrameBlock updateFrameBlock;
@property (nonatomic, copy  ) SelectedInfoBlock selectedBlcok;
@property (nonatomic, copy  ) NSArray *modelArray;
@property (nonatomic, copy  ) NSArray *oldModelArray;

@end

@implementation ApprovalGroupView

- (instancetype)initWithFrame:(CGRect)frame approvalGroupInfo:(NSArray<SelectInfoModel *> *)modelArray selectedInfo:(SelectedInfoBlock)selectedBlock {
    if (self = [super initWithFrame:frame]) {
        _selectedBlcok = selectedBlock;
        _modelArray = modelArray;
        [self creatApprovalGroup];
    }
    return self;
}

- (void)approvalGroupInfo:(NSArray<SelectInfoModel *> *)modelArray updateFrameBlock:(updateFrameBlock)updateFrameBlock selectedInfo:(SelectedInfoBlock)selectedBlock {
    _updateFrameBlock = updateFrameBlock;
    _selectedBlcok = selectedBlock;
    _modelArray = modelArray;
    [self creatApprovalGroup];
}

- (void)creatApprovalGroup {
    //判断数组
    if ([_modelArray isEqualToArray:_oldModelArray]) {
        return;
    }else {
        for (UIView *view in self.subviews) {
            [view removeFromSuperview];
        }
    }
    
    //创建按钮
    for (int i = 0; i < _modelArray.count; i++) {
        SelectInfoModel *model = _modelArray[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:model.type forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        CGFloat w = (K_SCREEN_WIDTH - getWidth(26) * 4) / 3;
        CGFloat x = i%3 * (w + getWidth(26)) + getWidth(26);
        CGFloat y = i/3 * getHeight(40);
        button.frame = CGRectMake(x, y, w, getHeight(30));
        [button setImage:[UIImage imageNamed:@"OACellTypeResource.bundle/approval_assign_rb_false.png"] forState:UIControlStateNormal];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, getWidth(10), 0, 0);
        button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
        if (K_SCREEN_WIDTH == K_PHONE_5_SCREEN_WIDTH) {
            button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:12];
        }
        button.tag = i;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    _oldModelArray = [NSArray arrayWithArray:_modelArray];
    
    //更新UI
    if (_updateFrameBlock) {
        _updateFrameBlock();
    }
}

- (void)buttonClicked:(UIButton *)sender {
    if (self.selectedBtn == sender) {
        
    }else {
        [sender setImage:[UIImage imageNamed:@"OACellTypeResource.bundle/approval_assign_rb_true.png"] forState:UIControlStateNormal];
        [self.selectedBtn setImage:[UIImage imageNamed:@"OACellTypeResource.bundle/approval_assign_rb_false.png"] forState:UIControlStateNormal];
    }
    self.selectedBtn = sender;
    
    SelectInfoModel *model = _modelArray[sender.tag];
    if (_selectedBlcok) {
        _selectedBlcok(model.key);
    }
}

@end
