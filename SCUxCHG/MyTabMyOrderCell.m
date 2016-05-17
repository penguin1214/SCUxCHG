//
//  MyTabMyOrderCell.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/17/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "MyTabMyOrderCell.h"

@interface MyTabMyOrderCell (){
    UIImageView* _vImage;
    UILabel* _vTitle;
}

@end
@implementation MyTabMyOrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier imageNamed:(NSString *)imageNamed title:(NSString *)title{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    _vImage = [[UIImageView alloc] init];
    _vImage.image = [UIImage imageNamed:imageNamed];
    [self addSubview:_vImage];
    
    [_vImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(16);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(25);
    }];
    
//    title
    _vTitle = [[UILabel alloc] init];
    _vTitle.text = title;
    [self addSubview:_vTitle];
    [_vTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_vImage.mas_right).with.offset(10);
        make.centerY.equalTo(self);
    }];
    
    return self;
}
@end
