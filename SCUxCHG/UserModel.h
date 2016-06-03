//
//  UserModel.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/15/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "BaseModel.h"
#import "UserEntity.h"

@interface UserModel : BaseModel
/**
 *  @brief  Check if the user is logged in by local storage.
 */
+ (BOOL)isUserLoggedIn;

/**
 *  @brief  Log in.
 */
+ (void)loginWithPhone:(NSString*)phone
              password:(NSString*)pwd
               success:(void(^)(BOOL result,
                                NSString* message,
                                UserEntity* user,
                                NSString* appCartCookieId))success
               failure:(void(^)(NSError* error))failure;

+ (void)saveUserInfoToUserDefault:(UserEntity*)user;

+ (void)checkUsableUsername:(NSString*)username
                    success:(void(^)(BOOL result, NSString* message))success
                    failure:(void(^)(NSError* error))failure;

+ (void)checkUsablePhone:(NSString*)phone
                    success:(void(^)(BOOL result, NSString* message))success
                    failure:(void(^)(NSError* error))failure;

+ (void)addNewUserOfUsername:(NSString*)username
                    andPhone:(NSString*)phone
                 andPassword:(NSString*)pwd
                   andCampus:(NSInteger)campus
                     success:(void(^)(BOOL result, NSString* message, UserEntity* user))success
                     failure:(void(^)(NSError* error))failure;

+ (void)loginWithAuthTokenSuccess:(void(^)(BOOL, NSString*, UserEntity*))success failure:(void(^)(NSError* error))failure;

@end
