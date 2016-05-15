//
//  ValidateUtil.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/15/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValidateUtil : NSObject

+ (BOOL)isValidPhone:(NSString*)phone error:(NSError **)err;

+ (BOOL)isValidPassword:(NSString*)pwd error:(NSError **)error;

@end
