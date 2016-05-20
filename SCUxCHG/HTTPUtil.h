//
//  HTTPUtil.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/15/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface HTTPUtil : AFHTTPSessionManager

/**
 *  @brief  封装HTTP请求
 */

+ (instancetype)sharedInstance;

//- (void)request:(NSString*)url
//          param:(NSMutableDictionary*)param
//        success:(void(^)(BOOL result, NSNumber* resultCode, NSDictionary* data))success
//        failure:(void(^)(NSError* error))failure;

/**
 *  @brief  get image array with failure
 */
-(void)getImageArrayFromURL:(NSString *)url success:(void(^)(NSArray* array))success failure:(void(^)(NSError* error))failure;

/**
 *  @brief  Get image array.
 */
-(void)getImageArrayFromURL:(NSString *)url success:(void(^)(NSArray* array))success;

/**
 *  @brief  Get single image with img_path formatted like 'activity/1.jpg'(without quote).
 */
//-(void)getImageFromURL:(NSString *)url withImagePath:(NSString*)imgPath success:(void(^)(NSArray* array))success;

@end
