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
    
    _nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    
    _priceLabel = [[UILabel alloc] init];
    [self addSubview:_priceLabel];
    
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
