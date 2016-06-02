//
//  UserRegStep3View.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 6/1/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserRegStep3Delegate <NSObject>

- (void)doClickNextBtn;

@end

@interface UserRegStep3View : UIView

@property (nonatomic, weak) id<UserRegStep3Delegate> delegate;

@end
