//
//  UserLoginView.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/7/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "UserLoginView.h"

@interface UserLoginView (){
    //phone number grid
    UIImageView *_phoneIcon;
    UITextField *_phoneText;
    UILabel *_phoneGridUnderline;
    
    //password grid
    UIImageView *_pwdIcon;
    UITextField *_pwdText;
    UILabel *_pwdGridUnderline;
    
    //button grid
    UIButton *_loginBtn;
    UIButton *_forgottenBtn;
    UIButton *_regiserBtn;
}

@end

@implementation UserLoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    return self;
    
}
@end
