//
//  UserLoginView.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/7/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserLoginViewDelegate <NSObject>

- (void)doClickLoginBtnWithPhone:(NSString*)phone password:(NSString*)pwd;

- (void)doClickRegisterBtn;

@end

@interface UserLoginView : UIView

@property (nonatomic, weak) id<UserLoginViewDelegate> delegate;
@end
