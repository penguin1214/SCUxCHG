//
//  ProductModel.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/25/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductModel

+(void)getProductWithId:(NSInteger)productId success:(void (^)(BOOL, NSString *, ProductEntity *))success failure:(void (^)(NSError *))failure{
    NSString* url = kUrlProduct;
    [[HTTPUtil sharedInstance] GET:url parameters:[RequestPackUtil packWithData:[NSNumber numberWithInteger:productId]] progress:nil success:^(NSURLSessionDataTask* task, id response){
        NSLog(@"%@", response);
        BOOL result = [[response objectForKey:kResponseResultKey] boolValue];
        NSString* message = [response objectForKey:kResponseMessageKey];
        NSDictionary* productDict = [response objectForKey:kResponseDataKey];
        ProductEntity* product = [[ProductEntity alloc] initWithDictionary:productDict error:nil];
        success(result, message, product);
    }failure:^(NSURLSessionDataTask* task, NSError* error){
        NSLog(@"%@", error);
    }];
}

+(void)getProductsIdOfCategory:(NSInteger)categoryId success:(void(^)(BOOL result, NSString* message, NSArray* productIds))success failure:(void(^)(NSError* error))failure{
    NSLog(@"getting products...");
    NSString* url = kUrlProductsOfCategory;
    NSDictionary* param = [RequestPackUtil packWithData:[NSNumber numberWithInteger:categoryId]];
    [[HTTPUtil sharedInstance] GET:url parameters:param progress:nil success:^(NSURLSessionDataTask* task, id response){
        NSLog(@"%@", response);
        BOOL result = [[response objectForKey:kResponseResultKey] boolValue];
        NSString* message = [response objectForKey:kResponseMessageKey];
        NSArray* productIds = [response objectForKey:kResponseDataKey];
        success(result, message, productIds);
    }failure:^(NSURLSessionDataTask* task, NSError* error){
        NSLog(@"Error: %@", error);
    }];
}

+ (void)getAllProductsIdsAndNamesDictionarySuccess:(void (^)(BOOL, NSString *, NSArray*))success failure:(void (^)(NSError *))failure{
    NSString* url = kUrlAllProductsPairs;
    [[HTTPUtil sharedInstance] GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask* task, id response){
        NSLog(@"!!!%@", response);
        BOOL result = [[response objectForKey:kResponseResultKey] boolValue];
        NSString* message = [response objectForKey:kResponseMessageKey];
        NSArray* allProductsIdsAndNamesPairs = [response objectForKey:kResponseDataKey];
        success(result, message, allProductsIdsAndNamesPairs);
    }failure:^(NSURLSessionDataTask* task, NSError* error){
       NSLog(@"Error: %@", error);
    }];
}

@end
