//
//  ProductModel.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/25/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "BaseModel.h"
#import "ProductEntity.h"

@interface ProductModel : BaseModel

+ (void)getProductWithId:(NSInteger)productId success:(void (^)(BOOL, NSString *, ProductEntity *))success failure:(void (^)(NSError *))failure;

+ (void)getProductsIdOfCategory:(NSInteger)categoryId success:(void(^)(BOOL result, NSString* message, NSArray* productIds))success failure:(void(^)(NSError* error))failure;


@end
