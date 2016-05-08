//
//  HomeTabRightTableViewCell.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/7/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "HomeTabRightTableViewCell.h"

@interface HomeTabRightTableViewCell (){
    UIImageView *_productImage;
    UILabel *_nameLabel;
    UILabel *_priceLabel;
    UILabel *_campusLabel;  //校区
    UILabel *_qualityLabel; //成色
}

@end
@implementation HomeTabRightTableViewCell

+ (CGFloat)height{
    return 85;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifie{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifie];
    if (!self) {
        return nil;
    }
    
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    _productImage = [[UIImageView alloc] init];
    [self addSubview:_productImage];
    [_productImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).with.offset(8);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    _nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_productImage.mas_right).with.offset(10);
        make.top.equalTo(self).with.offset(10);
    }];
    
    _priceLabel = [[UILabel alloc] init];
    [self addSubview:_priceLabel];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(_nameLabel);
        make.top.equalTo(_nameLabel.mas_bottom).with.offset(3);
    }];
    
    _campusLabel = [[UILabel alloc] init];
    [self addSubview:_campusLabel];
    [_campusLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_nameLabel);
        make.top.equalTo(_priceLabel.mas_bottom).with.offset(3);
    }];
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end