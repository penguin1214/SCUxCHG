//
//  UserRegStep1View.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 6/1/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserRegStep1Delegate <NSObject>

- (void)doClickRegBtnStep1WithPhone:(NSString*)phone andPassword:(NSString*)pwd;

@end

@interface UserRegStep1View : UIView

@property (nonatomic, weak) id<UserRegStep1Delegate> delegate;

@end
