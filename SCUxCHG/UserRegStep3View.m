//
//  UserRegStep3View.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 6/1/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "UserRegStep3View.h"

/**
 *  填写校区
 */
@interface UserRegStep3View (){
    UILabel* _vUserNameLabel;
//    UITextField* _vUserNameTextField;
//    UILabel *_vUserNameGridUnderline;
    UIButton* _vStep3NextBtn;
}

@end

@implementation UserRegStep3View

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (!self) {
        return  nil;
    }
    
    self.backgroundColor = kColorWhite;
    
//    UIView* _vUserNameGrid = [[UIView alloc] init];
//    UIView* _vButtonGrid = [[UIView alloc] init];
//    
//    [self addSubview:_vUserNameGrid];
//    [self addSubview:_vButtonGrid];
//    
//    [_vUserNameGrid mas_makeConstraints:^(MASConstraintMaker* make){
//        make.left.equalTo(self);
//        make.right.equalTo(self);
//        make.top.equalTo(self);
//        make.height.mas_equalTo(45);
//    }];
//    
//    _vUserNameLabel = [[UILabel alloc] init];
//    _vUserNameLabel.text = @"请选择你所在的校区";
//    _vUserNameLabel.textColor = kColorMainRed;
//    _vUserNameTextField.placeholder = @"校区";
//    [_vUserNameGrid addSubview:_vUserNameLabel];
//    [_vUserNameLabel mas_makeConstraints:^(MASConstraintMaker* make){
//        make.left.equalTo(_vUserNameGrid);
//        make.right.equalTo(_vUserNameGrid);
//        make.centerY.equalTo(_vUserNameGrid);
//        make.centerX.equalTo(_vUserNameGrid);
//        make.height.mas_equalTo(40);
//    }];
//    
//    NSLog(@"%@", _vUserNameGrid);
//    _vUserNameTextField = [[UITextField alloc] init];
//    _vUserNameTextField.keyboardType = UIKeyboardTypePhonePad;
//    [_vUserNameGrid addSubview:_vUserNameTextField];
//    [_vUserNameTextField mas_makeConstraints:^(MASConstraintMaker* make){
//        make.left.equalTo(_vUserNameLabel.mas_right).with.offset(10);
//        make.centerY.equalTo(_vUserNameGrid);
//        make.right.equalTo(_vUserNameGrid);
//    }];
    
//    _vUserNameGridUnderline = [[UILabel alloc] init];
//    _vUserNameGridUnderline.backgroundColor = kColorGray;
//    [_vUserNameGrid addSubview:_vUserNameGridUnderline];
//    [_vUserNameGridUnderline mas_makeConstraints:^(MASConstraintMaker* make){
//        make.left.equalTo(_vUserNameGrid);
//        make.right.equalTo(_vUserNameGrid);
//        make.top.equalTo(_vUserNameGrid.mas_baseline);
//        make.height.mas_equalTo(1);
//    }];
    
//    [_vButtonGrid mas_makeConstraints:^(MASConstraintMaker* make){
//        make.left.equalTo(_vUserNameGrid);
//        make.right.equalTo(_vUserNameGrid);
//        make.top.equalTo(_vUserNameGrid.mas_bottom);
//        make.height.mas_equalTo(300);   //height 300
//    }];
    
    _vStep3NextBtn = [[UIButton alloc] init];
    [_vStep3NextBtn setTitle:@"完成" forState:UIControlStateNormal];
    [_vStep3NextBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [_vStep3NextBtn setBackgroundColor:kColorMainRed];
    [self addSubview:_vStep3NextBtn];
    [_vStep3NextBtn mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self).with.offset(250);
    }];
    
    [_vStep3NextBtn addTarget:self action:@selector(clickNextBtn) forControlEvents:UIControlEventTouchUpInside];
    
    return self;
}

- (void)clickNextBtn{
    [self.delegate doClickNextBtn];
}

@end

