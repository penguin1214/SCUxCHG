//
//  categoryEntity.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/13/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "BaseEntity.h"

@interface categoryEntity : BaseEntity

@property (nonatomic, copy) NSString* cateName;
@property (nonatomic, copy) NSArray* productIds;

@end
