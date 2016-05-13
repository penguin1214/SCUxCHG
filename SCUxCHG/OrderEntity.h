//
//  OrderEntity.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/13/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "BaseEntity.h"

@interface OrderEntity : BaseEntity

@property (nonatomic, copy) NSNumber* totalPrice;
@property (nonatomic, copy) NSNumber* userId;   //long int
@property (nonatomic, copy) NSNumber* isPayed;  //bool
@property (nonatomic, copy) NSString* createDate;
@property (nonatomic, copy) NSString* payDate;
@property (nonatomic, copy) NSString* transactionId;
@property (nonatomic, copy) NSArray*  cartItemIds;

@end
