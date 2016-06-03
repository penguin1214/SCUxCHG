//
//  MyTabController.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/9/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"
#import "MyTabOrderItemCell.h"
#import "UserLoginController.h"

@interface MyTabController : BaseController <UITableViewDataSource, UITableViewDelegate, MyTabOrderItemCellDelegate, UserLoginControllerDelegate>

- (void)refreshUser:(UserEntity*)user;

@end
