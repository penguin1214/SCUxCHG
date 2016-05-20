//
//  HomeTabRightTableViewCell.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/7/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductEntity.h"

@interface HomeTabRightTableViewCell : UITableViewCell

+ (CGFloat)height;

- (void)fillContentWithProduct:(ProductEntity*)product;
@end
