//
//  CartItemEntity.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/13/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "BaseEntity.h"

@interface CartItemEntity : BaseEntity

@property (nonatomic, copy) NSNumber* count;    //int
@property (nonatomic, copy) NSNumber* isSelected;   //bool
@property (nonatomic, copy) NSNumber* isBought; //bool
@property (nonatomic, copy) NSNumber* productId;    //long int
@property (nonatomic, copy) NSNumber* boughtPrice;
@end
