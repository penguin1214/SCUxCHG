//
//  UserModel.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/15/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "UserModel.h"
#import "ProfileManager.h"

@implementation UserModel

+ (BOOL)isUserLoggedIn{
    NSString* userId = [[ProfileManager sharedInstance] getUserId];
    NSString* authToken = [[ProfileManager sharedInstance] getAuthToken];
    if (userId.length > 0 && authToken.length > 0) {
        return YES;
    }else{
        return NO;
    }
}

+(void)loginWithPhone:(NSString *)phone password:(NSString *)pwd success:(void (^)(BOOL result, NSString* message, UserEntity * user, NSString* appCartCookieId))success failure:(void (^)(NSError *))failure{
    NSString* url = kUrlUserLogin;
    NSString* password = [pwd MD5String];
    NSDictionary* data = [NSDictionary dictionaryWithObjectsAndKeys:
                           phone, @"phone",
                           password, @"password",
                           nil];
    NSDictionary* param = [RequestPackUtil packWithData:data];
    [[HTTPUtil sharedInstance] POST:url parameters:param progress:nil success:^(NSURLSessionDataTask* task, id response){
        NSLog(@"Response: %@", response);
        BOOL result = [[response objectForKey:kResponseResultKey] boolValue];
        NSString* message = [response objectForKey:kResponseMessageKey];
        NSDictionary* data = [response objectForKey:kDataKey];
        UserEntity* user = [[UserEntity alloc] initWithDictionary:data error:nil];
        NSString* appCartCookieId = @"appcartcookie";
        success(result, message, user, appCartCookieId);
    }failure:^(NSURLSessionDataTask* task, NSError* error){
        NSLog(@"Error: %@", error);
    }];
}

+(void)checkUsableUsername:(NSString *)username success:(void (^)(BOOL, NSString *))success failure:(void (^)(NSError *))failure{
    NSString* url = kUrlCheckUsableUserName;
    [[HTTPUtil sharedInstance] GET:url parameters:[RequestPackUtil packWithData:username] progress:nil success:^(NSURLSessionDataTask* task, id response){
        NSLog(@"Response: %@", response);
        BOOL result = [[response objectForKey:kResponseResultKey] boolValue];
        NSString* message = [response objectForKey:kResponseMessageKey];
        success(result, message);
    }failure:^(NSURLSessionDataTask* task, NSError* error){
        NSLog(@"Error: %@", error);
    }];
}

+(void)checkUsablePhone:(NSString *)phone success:(void (^)(BOOL, NSString *))success failure:(void (^)(NSError *))failure{
    NSString* url = kUrlCheckUsablePhone;
    [[HTTPUtil sharedInstance] GET:url parameters:[RequestPackUtil packWithData:phone] progress:nil success:^(NSURLSessionDataTask* task, id response){
        NSLog(@"Response: %@", response);
        BOOL result = [[response objectForKey:kResponseResultKey] boolValue];
        NSString* message = [response objectForKey:kResponseMessageKey];
        success(result, message);
    }failure:^(NSURLSessionDataTask* task, NSError* error){
        NSLog(@"Error: %@", error);
    }];
}

+ (void)addNewUserOfUsername:(NSString *)username andPhone:(NSString *)phone andPassword:(NSString *)pwd andCampus:(NSInteger)campus success:(void (^)(BOOL, NSString *, UserEntity *))success failure:(void (^)(NSError *))failure{
    NSString* url = kUrlAddNewUser;
    NSString* password = [pwd MD5String];
    NSDictionary* data = [NSDictionary dictionaryWithObjectsAndKeys:
                          username, @"username",
                          phone, @"phone",
                          password, @"password",
                          [NSNumber numberWithInteger:campus], @"campus", nil];
    NSDictionary* param = [RequestPackUtil packWithData:data];
    [[HTTPUtil sharedInstance] POST:url parameters:param progress:nil success: ^(NSURLSessionDataTask* task, id response){
        NSLog(@"Response: %@", response);
        BOOL result = [[response objectForKey:kResponseResultKey] boolValue];
        NSString* message = [response objectForKey:kResponseMessageKey];
        UserEntity* user = [[UserEntity alloc] initWithDictionary:[response objectForKey:kResponseDataKey] error:nil];
        success(result, message, user);
    }failure:^(NSURLSessionDataTask* task, NSError* error){
        NSLog(@"Error: %@", error);
    }];
}

+ (void)saveUserInfoToUserDefault:(UserEntity*)user{
    [[ProfileManager sharedInstance] saveUserId:[user.id stringValue]];
    [[ProfileManager sharedInstance] saveUserPhone:user.phone];
    [[ProfileManager sharedInstance] saveUserPwd:user.password];
    [[ProfileManager sharedInstance] saveAuthToken:user.auth_token];
}

+ (void)loginWithAuthTokenSuccess:(void (^)(BOOL, NSString *, UserEntity *))success failure:(void (^)(NSError *))failure{
    NSString* token = [[ProfileManager sharedInstance] getAuthToken];
    NSString* url = KUrlUserLoginWithAuthToken;
    NSDictionary* param = [RequestPackUtil packWithData:token];
    [[HTTPUtil sharedInstance] POST:url parameters:param progress:nil success:^(NSURLSessionDataTask* task, id response){
        NSLog(@"Response: %@", response);
        BOOL result = [[response objectForKey:kResponseResultKey] boolValue];
        NSString* message = [response objectForKey:kResponseMessageKey];
        UserEntity* user = [[UserEntity alloc] initWithDictionary:[response objectForKey:kResponseDataKey] error:nil];
        success(result, message, user);
    }failure:^(NSURLSessionDataTask* task, NSError* error){
        NSLog(@"Error: %@", error);
    }];
}
@end
