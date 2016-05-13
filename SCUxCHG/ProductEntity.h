//
//  ProductEntity.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/13/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "BaseEntity.h"

@interface ProductEntity : BaseEntity

@property (nonatomic, copy) NSString* productName;
@property (nonatomic, copy) NSNumber* productPrice; //float
@property (nonatomic, copy) NSString* productImage;
@property (nonatomic, copy) NSNumber* productCampus;    //int
@property (nonatomic, copy) NSNumber* productQuality;    //int
@end
