//
//  UserRegStep2Controller.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 6/1/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "BaseController.h"
#import "UserRegStep2View.h"
#import "UserRegStep3Controller.h"

@protocol UserRegStep2ControllerDelegate <NSObject>

- (void)backToStep1Controller;

@end

@interface UserRegStep2Controller : BaseController<UserRegStep2Delegate, UserRegStep3ControllerDelegate>
/**
 *  输入用户名，验证用户名是否可用。
 */
@property (nonatomic, weak) id<UserRegStep2ControllerDelegate> delegate;

- (void)refreshPhone:(NSString*)phone andPassword:(NSString*)pwd;

@end
