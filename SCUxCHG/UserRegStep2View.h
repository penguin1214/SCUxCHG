//
//  UserRegStep2View.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 6/1/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserRegStep2Delegate <NSObject>

- (void)doClickNextBtnWithUserName:(NSString*)name;

@end

@interface UserRegStep2View : UIView

@property (nonatomic, weak) id<UserRegStep2Delegate> delegate;

@end
