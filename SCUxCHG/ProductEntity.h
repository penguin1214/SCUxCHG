//
//  ProductEntity.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/13/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "BaseEntity.h"

@interface ProductEntity : BaseEntity

@property (nonatomic, copy) NSString   * name;
@property (nonatomic, copy) NSNumber   * category_id;//int
@property (nonatomic, copy) NSNumber   * price;//float
@property (nonatomic, copy) NSString   * image;
@property (nonatomic, copy) NSNumber   * campus;//int
@property (nonatomic, copy) NSString   * quality;
@end
