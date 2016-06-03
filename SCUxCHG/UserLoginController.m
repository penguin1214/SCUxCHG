//
//  UserLoginController.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/14/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "UserLoginController.h"
#import "ValidateUtil.h"
#import "UserRegStep1Controller.h"

@interface UserLoginController () <UserLoginViewDelegate>{
    UserLoginView* _vLoginView;
    UserRegStep1Controller* _cRegStep1Controller;
}

@end

@implementation UserLoginController

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.view = [[UIView alloc] initWithFrame:kScreenBound];
    _cRegStep1Controller = [[UserRegStep1Controller alloc] init];
    _cRegStep1Controller.delegate = self;
    
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
   
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.title = @"登录";
    
    _vLoginView = [[UserLoginView alloc] init];
    _vLoginView.delegate = self;

    [self.view addSubview:_vLoginView];
    [_vLoginView mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.view).with.offset(64);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
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
        [self toast:@"密码不能为空"];
        return;
    }
    [self showLoadingView];
    [UserModel loginWithPhone:phone password:pwd success:^(BOOL result, NSString* message, UserEntity* user, NSString* appCartCookieId){
        if (!result) {
            [UserModel saveUserInfoToUserDefault:user];
            [self passUser:user];
            [self toast:@"登录成功"];
            sleep(2);
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{
            if ([message  isEqual: @"wrong password"]) {
                [self toast:@"密码错误"];
            }else{
                [self toast:message];
            }
        }
    }failure:^(NSError* error){
        [self toastWithError:error];
        [self hideLoadingView];
    }];
}

-(void)doClickRegisterBtn{
    [self.navigationController pushViewController:_cRegStep1Controller animated:YES];
}

- (void)passUser:(UserEntity*)user{
    [self.delegate getUser:user];
}

#pragma mark - UserRegStep1ControllerDelegate
-(void)backToLoginController{
    [self.navigationController popViewControllerAnimated:NO];
}
@end
