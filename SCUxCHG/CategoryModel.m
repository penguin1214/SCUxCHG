//
//  CategoryModel.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/24/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "CategoryModel.h"
#import "CategoryEntity.h"

@implementation CategoryModel

+(void)getCategories:(void (^)(BOOL, NSString *, NSDictionary *))success failure:(void (^)(NSError *))failure{
#ifdef DEBUG
    NSLog(@"get categories...");
#endif
    NSString* url = kUrlCategories;
    [[HTTPUtil sharedInstance] GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask* task, id response){
        NSLog(@"%@", response);
        BOOL result = [[response objectForKey:kResponseResultKey] boolValue];
        NSString* message = [response objectForKey:kResponseMessageKey];
        NSDictionary* categories = [response objectForKey:kResponseDataKey];
        success(result, message, categories);
    }failure:^(NSURLSessionDataTask* task, NSError* error){
        NSLog(@"Error: %@", error);
    }];
#ifdef DEBUG
    NSLog(@"get categories finish");
#endif
}
@end
