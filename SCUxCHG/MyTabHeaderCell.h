//
//  MyTabHeaderCell.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/16/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>
#import "UserEntity.h"

@protocol MyTabHeaderCellDelegate <NSObject>

@end


@interface MyTabHeaderCell : UITableViewCell

+ (CGFloat)height;

- (void)fillContentWithUser:(UserEntity *)user;

@end
