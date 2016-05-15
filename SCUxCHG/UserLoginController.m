//
//  UserLoginController.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/14/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "UserLoginController.h"
#import "ValidateUtil.h"

@interface UserLoginController () <UserLoginViewDelegate>{
    UserLoginView* _vLoginView;
}

@end

@implementation UserLoginController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"登录";
    
    _vLoginView = [[UserLoginView alloc] initWithFrame:kScreenBound];
    _vLoginView.delegate = self;
    [self.view addSubview:_vLoginView];
    
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

#pragma mark - UserLoginViewDelegate

- (void)doClickLoginBtnWithPhone:(NSString *)phone password:(NSString *)pwd{
    NSError* err = nil;
    if (![ValidateUtil isValidPhone:phone error:&err]) {
        return;
    }
    
    if (pwd.length <= 0) {
        return;
    }
}

-(void)doClickRegisterBtn{
    
}
@end
