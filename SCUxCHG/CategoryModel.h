//
//  CategoryModel.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/24/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "BaseModel.h"

@interface CategoryModel : BaseModel

+ (void)getCategories:(void(^)(BOOL result, NSString* message, NSDictionary* categories))success
              failure:(void(^)(NSError* error))failure;

@end
