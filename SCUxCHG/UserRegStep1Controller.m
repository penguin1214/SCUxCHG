//
//  UserRegStep1Controller.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 6/1/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "UserRegStep1Controller.h"
#import "UserRegStep2Controller.h"

@interface UserRegStep1Controller (){
    UserRegStep1View* _vRegViewStep1;
    UserRegStep2Controller* _cRegStep2Controller;
}

@end

@implementation UserRegStep1Controller

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.view = [[UIView alloc] initWithFrame:kScreenBound];
    _cRegStep2Controller = [[UserRegStep2Controller alloc] init];
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.title = @"注册";
    
    _vRegViewStep1 = [[UserRegStep1View alloc] initWithFrame:kScreenBound];
    _vRegViewStep1.delegate = self;
    [self.view addSubview:_vRegViewStep1];
    [_vRegViewStep1 mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.view).with.offset(64);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}

#pragma mark - UserRegStep1Delegate

-(void)doClickRegBtnStep1WithPhone:(NSString *)phone andPassword:(NSString *)pwd{
    NSLog(@"进入第二步");
    [self.navigationController pushViewController:_cRegStep2Controller animated:YES];
}
@end
