//
//  SellTabView.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 6/3/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "SellTabView.h"

@interface SellTabView (){
    //name grid
    UILabel* _vNameLabel;
    
    //discription grid
    UILabel* _vDiscLabel;
    
    //price grid
    UILabel* _vPriceLabel;
    
    //category grid
    UILabel* _vCategoryLabel;
    
    //quality grid
    UILabel* _vQualityLabel;
    
    //upload image grid
    UILabel* _vChooseImageLabel;
    UIButton* _vChooseImageBtn;
    UIImageView* _vImageView;
    
    //submit button
    UIButton* _vSubmitBtn;
}

@end

@implementation SellTabView

@synthesize vNameText = _vNameText;
@synthesize vDiscText = _vDiscText;
@synthesize vPriceText = _vPriceText;
@synthesize vCategoryText = _vCategoryText;
@synthesize vQualityText = _vQualityText;


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    self.backgroundColor = kColorWhite;
    UIView* _vNameGrid = [[UIView alloc] init];
    UIView* _vDiscGrid = [[UIView alloc] init];
    UIView* _vPriceGrid = [[UIView alloc] init];
    UIView* _vCategoryGrid = [[UIView alloc] init];
    UIView* _vQualityGrid = [[UIView alloc] init];
    UIView* _vImageGrid = [[UIView alloc] init];
    UIView* _vButtonGrid = [[UIView alloc] init];
    
    [self addSubview:_vNameGrid];
    [self addSubview:_vDiscGrid];
    [self addSubview:_vPriceGrid];
    [self addSubview:_vCategoryGrid];
    [self addSubview:_vQualityGrid];
    [self addSubview:_vImageGrid];
    [self addSubview:_vButtonGrid];
    
    // name grid
    [_vNameGrid mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.mas_equalTo(45);
    }];
    
//    _vNameLabel = [[UILabel alloc] init];
//    [_vNameGrid addSubview:_vNameLabel];
//    _vNameLabel.text = @"商品名";
//    [_vNameLabel mas_makeConstraints:^(MASConstraintMaker* make){
//        make.left.equalTo(_vNameGrid).with.offset(8);
//        make.right.equalTo(_vNameGrid).with.offset(-8);
//        make.centerY.equalTo(_vNameGrid);
//        make.height.mas_equalTo(40);
//    }];
    
    _vNameText = [[UITextField alloc] init];
    _vNameText.font = [UIFont systemFontOfSize:13];
    _vNameText.placeholder = @" 请输入商品名";
    _vNameText.keyboardType = UIKeyboardTypePhonePad;
    [_vNameText.layer setBorderColor:[[kColorMainRed colorWithAlphaComponent:0.5] CGColor]];
    [_vNameText.layer setBorderWidth:1.0];
    _vNameText.layer.cornerRadius = 5;
    _vNameText.clipsToBounds = YES;
    [_vNameGrid addSubview:_vNameText];
    [_vNameText mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vNameGrid).with.offset(10);
        make.centerY.equalTo(_vNameGrid);
        make.right.equalTo(_vNameGrid).with.offset(-10);
        make.height.mas_equalTo(30);
    }];
    
    [_vDiscGrid mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vNameGrid);
        make.right.equalTo(_vNameGrid);
        make.top.equalTo(_vNameGrid.mas_bottom);
        make.height.mas_equalTo(80);
    }];

    _vDiscText = [[UITextView alloc] init];
    _vDiscText.text = @"请输入商品描述";
    _vDiscText.textColor = [UIColor lightGrayColor];
    [_vDiscText.layer setBorderColor:[[kColorMainRed colorWithAlphaComponent:0.5] CGColor]];
    [_vDiscText.layer setBorderWidth:1.0];
    _vDiscText.layer.cornerRadius = 5;
    _vDiscText.clipsToBounds = YES;
    [_vDiscGrid addSubview:_vDiscText];
    [_vDiscText mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(_vDiscGrid).with.offset(10);
        make.left.equalTo(_vDiscGrid).with.offset(10);
        make.right.equalTo(_vDiscGrid).with.offset(-10);
        make.bottom.equalTo(_vDiscGrid).with.offset(-10);
    }];
    
    [_vPriceGrid mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vNameGrid);
        make.right.equalTo(_vNameGrid);
        make.top.equalTo(_vDiscGrid.mas_bottom);
        make.height.mas_equalTo(45);
    }];
    
    _vPriceText = [[UITextField alloc] init];
    _vPriceText.font = [UIFont systemFontOfSize:13];
    _vPriceText.placeholder = @" 请输入商品价格";
    _vPriceText.keyboardType = UIKeyboardTypePhonePad;
    [_vPriceText.layer setBorderColor:[[kColorMainRed colorWithAlphaComponent:0.5] CGColor]];
    [_vPriceText.layer setBorderWidth:1.0];
    _vPriceText.layer.cornerRadius = 5;
    _vPriceText.clipsToBounds = YES;
    [_vPriceGrid addSubview:_vPriceText];
    [_vPriceText mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vPriceGrid).with.offset(10);
        make.centerY.equalTo(_vPriceGrid);
        make.right.equalTo(_vPriceGrid).with.offset(-10);
        make.height.mas_equalTo(30);
    }];
    
    [_vCategoryGrid mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vNameGrid);
        make.right.equalTo(_vNameGrid);
        make.top.equalTo(_vPriceGrid.mas_bottom);
        make.height.mas_equalTo(45);
    }];
    
    _vCategoryText = [[UITextField alloc] init];
    _vCategoryText.font = [UIFont systemFontOfSize:13];
    _vCategoryText.textAlignment = NSTextAlignmentCenter;
    _vCategoryText.keyboardType = UIKeyboardTypePhonePad;
    [_vCategoryText.layer setBorderColor:[[kColorMainRed colorWithAlphaComponent:0.5] CGColor]];
    [_vCategoryText.layer setBorderWidth:1.0];
    _vCategoryText.layer.cornerRadius = 5;
    _vCategoryText.clipsToBounds = YES;
    [_vCategoryGrid addSubview:_vCategoryText];
    [_vCategoryText mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vCategoryGrid).with.offset(10);
        make.centerY.equalTo(_vCategoryGrid);
        make.right.equalTo(_vCategoryGrid).with.offset(-10);
        make.height.mas_equalTo(30);
    }];

    
    [_vQualityGrid mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vNameGrid);
        make.right.equalTo(_vNameGrid);
        make.top.equalTo(_vCategoryGrid.mas_bottom);
        make.height.mas_equalTo(45);
    }];
    
    _vQualityText = [[UITextField alloc] init];
    _vQualityText.font = [UIFont systemFontOfSize:13];
    _vQualityText.textAlignment = NSTextAlignmentCenter;
    _vQualityText.keyboardType = UIKeyboardTypePhonePad;
    [_vQualityText.layer setBorderColor:[[kColorMainRed colorWithAlphaComponent:0.5] CGColor]];
    [_vQualityText.layer setBorderWidth:1.0];
    _vQualityText.layer.cornerRadius = 5;
    _vQualityText.clipsToBounds = YES;
    [_vQualityGrid addSubview:_vQualityText];
    [_vQualityText mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vQualityGrid).with.offset(10);
        make.centerY.equalTo(_vQualityGrid);
        make.right.equalTo(_vQualityGrid).with.offset(-10);
        make.height.mas_equalTo(30);
    }];
    
    [_vImageGrid mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vNameGrid);
        make.right.equalTo(_vNameGrid);
        make.top.equalTo(_vQualityGrid.mas_bottom);
        make.height.mas_equalTo(30);
    }];
    
    _vChooseImageLabel = [[UILabel alloc] init];
    _vChooseImageLabel.text = @"商品图片";
    _vChooseImageLabel.font = [UIFont systemFontOfSize:13];
    _vChooseImageLabel.textAlignment = NSTextAlignmentCenter;
    [_vImageGrid addSubview:_vChooseImageLabel];
    [_vChooseImageLabel mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vImageGrid).with.offset(10);
        make.centerY.equalTo(_vImageGrid);
        make.right.equalTo(_vImageGrid.mas_centerX).with.offset(-5);
        make.height.mas_equalTo(25);
    }];
    
    _vImageView = [[UIImageView alloc] init];
    [_vImageGrid addSubview:_vImageView];
    [_vImageView mas_makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(_vImageGrid);
        make.centerX.equalTo(_vImageGrid);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    
    _vChooseImageBtn = [[UIButton alloc] init];
    [_vChooseImageBtn setTitle:@"选择图片" forState:UIControlStateNormal];
    [_vChooseImageBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _vChooseImageBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_vChooseImageBtn setBackgroundColor:kColorGray];
    [_vImageGrid addSubview:_vChooseImageBtn];
    [_vChooseImageBtn mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vImageGrid.mas_centerX).with.offset(5);
        make.right.equalTo(_vImageGrid).with.offset(-10);
        make.centerY.equalTo(_vImageGrid);
        make.height.mas_equalTo(25);
    }];
    
    [_vButtonGrid mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_vNameGrid);
        make.right.equalTo(_vNameGrid);
        make.top.equalTo(_vImageGrid.mas_bottom).with.offset(10);
        make.height.mas_equalTo(30);
    }];
    
    _vSubmitBtn = [[UIButton alloc] init];
    [_vSubmitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [_vSubmitBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [_vSubmitBtn setBackgroundColor:kColorMainRed];
    _vSubmitBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_vButtonGrid addSubview:_vSubmitBtn];
    [_vSubmitBtn mas_makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(_vButtonGrid);
        make.left.equalTo(_vButtonGrid).with.offset(10);
        make.right.equalTo(_vButtonGrid).with.offset(-10);
        make.height.mas_equalTo(30);
    }];
    
    [self reloadImageView];
    
    [_vChooseImageBtn addTarget:self action:@selector(clickChooseImageBtn) forControlEvents:UIControlEventTouchUpInside];
    [_vSubmitBtn addTarget:self action:@selector(clickSubmitBtn) forControlEvents:UIControlEventTouchUpInside];
    return self;
}

- (void)clickChooseImageBtn{
    [self.delegate doClickChooseImageBtn];
}

- (void)clickSubmitBtn{
    
}

- (void)refreshImage:(UIImage *)image{
    _vImageView.image = image;
}

-(void)reloadImageView{
    if (_vImageView.image) {
        _vChooseImageLabel.hidden = YES;
        _vImageView.hidden = NO;
    }else{
        _vChooseImageLabel.hidden = NO;
        _vImageView.hidden = YES;
    }
}
@end
