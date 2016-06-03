//
//  UserLoginController.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/14/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"
#import "UserLoginView.h"
#import "UserRegStep1Controller.h"

@protocol UserLoginControllerDelegate <NSObject>

-(void)getUser:(UserEntity*)user;

@end

@interface UserLoginController : BaseController<UserRegStep1ControllerDelegate>

@property (nonatomic, weak) id<UserLoginControllerDelegate> delegate;

@end
