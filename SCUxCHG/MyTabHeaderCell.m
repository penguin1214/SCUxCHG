//
//  MyTabHeaderCell.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/16/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "MyTabHeaderCell.h"
#import "ProfileManager.h"

@interface MyTabHeaderCell (){
    UIImageView *_vImage;
    UILabel *_vName;
    UILabel *_vLevel;
    UILabel *_vNotLogin;
}

@end

@implementation MyTabHeaderCell

+ (CGFloat)height
{
    return 90;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) return nil;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // set cell background image
    UIImageView *vBgImage = [UIImageView new];
    vBgImage.image = [UIImage imageNamed:@"head_bg"];
    //    self.backgroundView = vBgImage;
    self.backgroundColor = [UIColor clearColor];
    [self setBackgroundView:vBgImage];
    
    //_vImage
    CGFloat vImageWidth = 60;
    CGFloat vImageHeight = 60;
    _vImage = [UIImageView new];
    _vImage.image = [UIImage imageNamed:@"head"];
    [self addSubview:_vImage];
    [_vImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(20);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(vImageWidth);
        make.height.mas_equalTo(vImageHeight);
    }];
    
    //_vName
    _vName = [UILabel new];
    _vName.textColor = kColorWhite;
    _vName.hidden = YES;
    [self addSubview:_vName];
    [_vName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_vImage.mas_right).with.offset(10);
        make.top.equalTo(self).with.offset(25);
    }];
    
    //_vLevel
    _vLevel = [UILabel new];
    _vLevel.textColor = kColorWhite;
    _vLevel.textAlignment = NSTextAlignmentCenter;
    _vLevel.layer.borderWidth = 1;
    _vLevel.layer.borderColor = kColorWhite.CGColor;
    _vLevel.layer.cornerRadius = 3;
    _vLevel.hidden = YES;
    [self addSubview:_vLevel];
    [_vLevel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_vName);
        make.top.equalTo(_vName.mas_bottom).with.offset(2);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(25);
    }];
    
    //_vNotLogin
    _vNotLogin = [UILabel new];
    _vNotLogin.textColor = kColorMainRed;
    _vNotLogin.font = [UIFont systemFontOfSize:19];
    _vNotLogin.hidden = YES;
    [self addSubview:_vNotLogin];
    [_vNotLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_vLevel);
        make.centerY.equalTo(self);
    }];
    
    [self fillContentByStorage];
    
    return self;
}

- (void)fillContentWithUser:(UserEntity *)user
{
    if (user.id) {
        _vName.text = user.userPhone;
        _vName.hidden = NO;
        _vLevel.text = [user.userLevel stringValue];
        _vLevel.hidden = NO;
        _vNotLogin.hidden = YES;
    } else {
        _vNotLogin.text = @"登录/注册";
        _vName.hidden = YES;
        _vLevel.hidden = YES;
        _vNotLogin.hidden = NO;
    }
}

- (void)fillContentByStorage
{
    NSString *userId = [[ProfileManager sharedInstance] getUserId];
    NSString *userPhone = [[ProfileManager sharedInstance] getUserPhone];
    NSString *userLevel = [[ProfileManager sharedInstance] getUserLevel];
    UserEntity *user = [[UserEntity alloc] init];
    user.id = [NSNumber numberWithLong:[userId integerValue]];
    user.userPhone = userPhone;
    user.userLevel = [NSNumber numberWithLong:[userLevel integerValue]];
    [self fillContentWithUser:user];
}
@end
