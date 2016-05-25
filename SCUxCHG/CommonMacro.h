//
//  CommonMacro.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/14/16.
//  Copyright © 2016 yang. All rights reserved.
//

#ifndef CommonMacro_h
#define CommonMacro_h

#define kScreenBound    [[UIScreen mainScreen] bounds]

//  client request key
#define kLogStatKey   @"logStat"
#define kUserIdKey    @"userId"
#define kAuthTokenKey @"authToken"
#define kDataKey      @"data"

//  server request key
#define kResponseResultKey      @"result"
#define kResponseMessageKey     @"message"
#define kResponseDataKey        @"data"

//  list status
#define kListStatusPenddingPay      @"1"
#define kListStatusDelivering       @"2"
#define kListStatusFinished         @"3"

#define kCampusJiangAn          @"江安"
#define kCampusWangJiang        @"望江"
#define kCampusHuaXi            @"华西"

#endif /* CommonMacro_h */
