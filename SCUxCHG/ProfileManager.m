//
//  ProfileManager.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/13/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "ProfileManager.h"
#import "UserDefaultUtil.h"

@implementation ProfileManager

+ (instancetype)sharedInstance{
    static dispatch_once_t once;
    static id instance = nil;
    
    dispatch_once(&once, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    
    return instance;
}
- (void)saveUserId:(NSString *)userId{
    [UserDefaultUtil saveObject:userId forKey:kProfileUserId];
}

-(void)saveUserPwd:(NSString *)userPwd{
    [UserDefaultUtil saveObject:userPwd forKey:kProfileUserPwd];
}

-(void)saveUserPhone:(NSString *)userPhone{
    [UserDefaultUtil saveObject:userPhone forKey:kProfileUserPhone];
}
-(void)saveAuthToken:(NSString *)authToken{
    [UserDefaultUtil saveObject:authToken forKey:kProfileAuthToken];
}

- (NSString *)getUserId{
    return [UserDefaultUtil getObjectBykey:kProfileUserId];
}

-(NSString *)getUserPwd{
    return [UserDefaultUtil getObjectBykey:kProfileUserPwd];
}

-(NSString *)getAuthToken{
    return [UserDefaultUtil getObjectBykey:kProfileAuthToken];
}

-(BOOL)checkLogin{
    return [self getAuthToken].length != 0;
}

- (void)logout{
    [self saveUserId:@""];
    [self saveUserPwd:@""];
    [self saveAuthToken:@""];
}
@end
