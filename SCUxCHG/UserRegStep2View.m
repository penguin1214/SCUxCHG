//
//  UserRegStep2View.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 6/1/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "UserRegStep2View.h"

@interface UserRegStep2View (){
    UIImageView* _vUserNameIcon;
    UITextField* _vUserNameTextField;
    UIButton* _vStep2NextBtn;
    UILabel *_vUserNameGridUnderline;
}

@end

@implementation UserRegStep2View

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (!self) {
        return  nil;
    }
    
    self.backgroundColor = kColorWhite;
    
    UIView* _vUserNameGrid = [[UIView alloc] init];
    UIView* _vButtonGrid = [[UIView alloc] init];
    
    [self addSubview:_vUserNameGrid];
    [self addSubview:_vButtonGrid];
    
    [_vUserNameGrid mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(self).with.offset(8);
        make.right.equalTo(self).with.offset(-8);
        make.top.equalTo(self).with.offset(8);
        make.height.mas_equalTo(45);
    }];
    
    _vUserNameIcon = [[UIImageView alloc] init];
    _vUserNameIcon.image = [UIImage imageNamed:@"icon_account"];
    [_vUserNameGrid addSubview:_vUserNameIcon];
    [_vUserNameIcon mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vUserNameGrid);
        make.centerY.equalTo(_vUserNameGrid);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    _vUserNameTextField = [[UITextField alloc] init];
    _vUserNameTextField.placeholder = @"用户名";
    _vUserNameTextField.keyboardType = UIKeyboardTypePhonePad;
    [_vUserNameGrid addSubview:_vUserNameTextField];
    [_vUserNameTextField mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vUserNameIcon.mas_right).with.offset(10);
        make.centerY.equalTo(_vUserNameGrid);
        make.right.equalTo(_vUserNameGrid);
    }];
    
    _vUserNameGridUnderline = [[UILabel alloc] init];
    _vUserNameGridUnderline.backgroundColor = kColorGray;
    [_vUserNameGrid addSubview:_vUserNameGridUnderline];
    [_vUserNameGridUnderline mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vUserNameGrid);
        make.right.equalTo(_vUserNameGrid);
        make.top.equalTo(_vUserNameGrid.mas_baseline);
        make.height.mas_equalTo(1);
    }];
    
    [_vButtonGrid mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vUserNameGrid);
        make.right.equalTo(_vUserNameGrid);
        make.top.equalTo(_vUserNameGrid.mas_bottom);
        make.height.mas_equalTo(300);   //height 300
    }];
    
    _vStep2NextBtn = [[UIButton alloc] init];
    [_vStep2NextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [_vStep2NextBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [_vStep2NextBtn setBackgroundColor:kColorMainRed];
    [_vButtonGrid addSubview:_vStep2NextBtn];
    [_vStep2NextBtn mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vButtonGrid);
        make.right.equalTo(_vButtonGrid);
        make.top.equalTo(_vButtonGrid).with.offset(20);
    }];
    
    [_vStep2NextBtn addTarget:self action:@selector(clickNextBtn) forControlEvents:UIControlEventTouchUpInside];
    
    return self;
}

#pragma mark - Action

- (void)clickNextBtn{
    [self.delegate doClickNextBtnWithUserName:_vUserNameTextField.text];
}
@end
