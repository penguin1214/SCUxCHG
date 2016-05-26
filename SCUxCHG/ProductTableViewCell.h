//
//  ProductTableViewCell.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/26/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductEntity.h"

@interface ProductTableViewCell : UITableViewCell

+ (CGFloat)height;

- (void)fillContentWithProduct:(ProductEntity*)product;

@end
