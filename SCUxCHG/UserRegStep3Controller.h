//
//  UserRegStep3Controller.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 6/1/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "BaseController.h"
#import "UserRegStep3View.h"

@protocol UserRegStep3ControllerDelegate <NSObject>

- (void)backToStep2Controller;

@end

@interface UserRegStep3Controller : BaseController<UIPickerViewDelegate, UIPickerViewDataSource, UserRegStep3Delegate>

- (void)refreshUsername:(NSString*)username andPhone:(NSString*)phone andPassword:(NSString*)pwd;

@property (nonatomic, weak) id<UserRegStep3ControllerDelegate> delegate;
@end
