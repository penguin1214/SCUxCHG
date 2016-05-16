//
//  HTTPUtil.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/15/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "HTTPUtil.h"
#import "ProfileManager.h"

@implementation HTTPUtil

+(instancetype)sharedInstance{
    static HTTPUtil* manager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[HTTPUtil alloc] init];
    });
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    return manager;
}

//- (void)request:(NSString *)url param:(NSMutableDictionary *)param success:(void (^)(BOOL, NSNumber *, NSDictionary *))success failure:(void (^)(NSError *))failure{
//    
////    NSString* appCartCookieId = [[ProfileManager sharedInstance] ]
//    NSString* userId = [[ProfileManager sharedInstance] getUserId];
//    NSString* authToken = [[ProfileManager sharedInstance] getAuthToken];
//    
//    if (userId.length > 0) {
//        [param setObject:userId forKey:kProfileUserId];
//    }
//    if (authToken.length > 0) {
//        [param setObject:authToken forKey:kProfileAuthToken];
//    }
//    
//}
@end
