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
    NSDictionary* data = [NSDictionary dictionaryWithObjectsAndKeys:
                           phone, @"phone",
                           pwd, @"password",
                           nil];
    NSDictionary* param = [RequestPackUtil packWithData:data];
    [[HTTPUtil sharedInstance] POST:url parameters:param progress:nil success:^(NSURLSessionDataTask* task, id response){
        NSLog(@"Response: %@", response);
        BOOL result = [[response objectForKey:kResponseResultKey] boolValue];
        NSString* message = [response objectForKey:kResponseMessageKey];
        UserEntity* user = [[UserEntity alloc] initWithDictionary:[[response objectForKey:kResponseDataKey] objectForKey:@"user"] error:nil];
        NSString* appCartCookieId = @"appcartcookie";
        success(result, message, user, appCartCookieId);
    }failure:^(NSURLSessionDataTask* task, NSError* error){
        NSLog(@"Error: %@", error);
    }];
}

+ (void)saveUserInfoToUserDefault:(UserEntity*)user{
    [[ProfileManager sharedInstance] saveUserId:[user.id stringValue]];
    [[ProfileManager sharedInstance] saveUserPhone:user.userPhone];
    [[ProfileManager sharedInstance] saveUserPwd:user.userPwd];
    [[ProfileManager sharedInstance] saveAuthToken:user.authToken];
}
@end
