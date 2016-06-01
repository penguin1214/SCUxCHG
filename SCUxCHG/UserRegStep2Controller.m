//
//  UserRegStep2Controller.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 6/1/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "UserRegStep2Controller.h"
#import "UserRegStep2View.h"

@interface UserRegStep2Controller (){
    UserRegStep2View* _vRegViewStep2;
}

@end

@implementation UserRegStep2Controller
-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.view = [[UIView alloc] initWithFrame:kScreenBound];
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.title = @"注册";
    
    _vRegViewStep2 = [[UserRegStep2View alloc] initWithFrame:kScreenBound];
    
    [self.view addSubview:_vRegViewStep2];
    [_vRegViewStep2 mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.view).with.offset(64);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}
@end
