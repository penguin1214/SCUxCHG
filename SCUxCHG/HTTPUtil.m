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

-(void)getImageArrayFromURL:(NSString *)url success:(void (^)(NSArray *))success{
    //    change serializer
    //    self.responseSerializer = [AFImageResponseSerializer serializer];
    
//    [self GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask* task, id response){
    [self GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask* task, id response){
        NSLog(@"Response: %@", response);

        NSString* imgStr = [response objectForKey:kResponseDataKey];
        //convert nsstring to nsarray
        NSCharacterSet *c = [NSCharacterSet characterSetWithCharactersInString:@"[] "];
        NSArray *array = [[[imgStr componentsSeparatedByCharactersInSet:c]
                           componentsJoinedByString:@""]
                          componentsSeparatedByString:@","];
        //        NSArray* array = [imgStr componentsSeparatedByString:@","];
        
        //construct urls
        NSMutableArray* ret = [[NSMutableArray alloc] init];
        NSMutableString* url;
        for (NSString* rawStr in array) {
            url = [NSMutableString stringWithString:kUrlBase];
            NSMutableString * newstr = [rawStr stringByReplacingOccurrencesOfString:@"/" withString:@"+"];
            [url appendString:newstr];
            [ret addObject:url];
        }
         success(ret);
    }failure:^(NSURLSessionDataTask* task, NSError* error){
        NSLog(@"Error: %@", error);
    }];
}

-(void)getImageArrayFromURL:(NSString *)url success:(void(^)(NSArray* array))success failure:(void(^)(NSError* error))failure{
    [self GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask* task, id response){
        NSLog(@"Response: %@", response);
        NSString* imgStr = [response objectForKey:kResponseDataKey];
        
        //convert nsstring to nsarray
        NSArray* array = [StringUtil arrayFromString:imgStr];
        
        //construct urls
        NSMutableArray* ret = [[NSMutableArray alloc] init];
        NSMutableString* url;
        for (NSString* rawStr in array) {
            url = [NSMutableString stringWithString:kUrlBase];
            [url appendString:[rawStr stringByReplacingOccurrencesOfString:@"/" withString:@"+"]];
            [ret addObject:url];
        }
        success(ret);
    }failure:^(NSURLSessionDataTask* task, NSError* error){
        NSLog(@"Error: %@", error);
        failure(error);
    }];
}


//- (void)request:(NSString *)url param:(NSMutableDictionary *)param success:(void (^)(BOOL, NSNumber *, NSDictionary *))success failure:(void (^)(NSError *))failure{
//    
//    NSString* appCartCookieId = [[ProfileManager sharedInstance] ]
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
