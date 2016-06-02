//
//  UserRegStep1Controller.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 6/1/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "BaseController.h"
#import "UserRegStep1View.h"
#import "UserRegStep2Controller.h"

@protocol UserRegStep1ControllerDelegate <NSObject>

- (void)backToLoginController;

@end

@interface UserRegStep1Controller : BaseController<UserRegStep1Delegate,UserRegStep2ControllerDelegate>
/**
 *  输入手机、密码，验证手机号是否可用。
 */
@property (nonatomic, weak) id<UserRegStep1ControllerDelegate> delegate;

@end
