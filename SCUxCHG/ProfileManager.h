//
//  ProfileManager.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/13/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserEntity.h"

@interface ProfileManager : NSObject

/**
 *  @brief  Singleton
 */
+ (instancetype)sharedInstance;

/**
 *  @brief  Save user id in UserDefault.
 */
- (void)saveUserId:(NSString*)userId;

/**
 *  @brief  Save user password(MD5) in UserDefault.
 */
- (void)saveUserPwd:(NSString*)userPwd;

/**
 *  @brief  Save authenticate token in UserDefault.
 */
- (void)saveAuthToken:(NSString*)authToken;

- (void)saveUserPhone:(NSString*)userPhone;

- (NSString*)getUserId;

- (NSString*)getUserPwd;

- (NSString*)getUserPhone;

- (NSString*)getUserLevel;

- (NSString*)getAuthToken;

-(BOOL)checkLogin;

-(void)logout;



@end
