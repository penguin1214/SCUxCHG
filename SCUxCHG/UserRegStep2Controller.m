//
//  UserRegStep2Controller.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 6/1/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "UserRegStep2Controller.h"
#import "UserRegStep2View.h"
#import "UserRegStep3Controller.h"

@interface UserRegStep2Controller (){
    UserRegStep2View* _vRegViewStep2;
    UserRegStep3Controller* _cRegStep3Controller;
    NSString* _phone;
    NSString* _password;
    NSString* _username;
}

@end

@implementation UserRegStep2Controller
-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.view = [[UIView alloc] initWithFrame:kScreenBound];
    _cRegStep3Controller = [[UserRegStep3Controller alloc] init];
    _cRegStep3Controller.delegate = self;
    
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.title = @"注册";
    
    _vRegViewStep2 = [[UserRegStep2View alloc] initWithFrame:kScreenBound];
    _vRegViewStep2.delegate = self;
    
    [self.view addSubview:_vRegViewStep2];
    [_vRegViewStep2 mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.view).with.offset(64);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}

#pragma mark - UserRegStep2Delegate

- (void)doClickNextBtnWithUserName:(NSString *)name{
    _username = name;
    [UserModel checkUsableUsername:name success:^(BOOL result, NSString* message){
        if (!result) {
            [_cRegStep3Controller refreshUsername:_username andPhone:_phone andPassword:_password];
//            [self toast:@"用户名验证成功！"];
//            sleep(2);
            [self.navigationController pushViewController:_cRegStep3Controller animated:YES];
        }else{
            [self toast:@"用户名已被占用"];
        }
    }failure:^(NSError* error){
        NSLog(@"%@", error);
    }];
}

#pragma mark - Data Refreshing

-(void)refreshPhone:(NSString *)phone andPassword:(NSString *)pwd{
    _phone = [NSString stringWithString:phone];
    _password = [NSString stringWithString:pwd];
}

#pragma mark - UserRegStep3ControllerDelegate
-(void)backToStep2Controller{
    [self.navigationController popViewControllerAnimated:NO];
    [self.delegate backToStep1Controller];
}
@end
