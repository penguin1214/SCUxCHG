//
//  StringUtil.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/19/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "StringUtil.h"

@implementation StringUtil

-(NSArray *)arrayFromString:(NSString *)str{
    NSCharacterSet *c = [NSCharacterSet characterSetWithCharactersInString:@"[] "];
    NSArray *array = [[[str componentsSeparatedByCharactersInSet:c]
                       componentsJoinedByString:@""]
                      componentsSeparatedByString:@","];
    return array;
}
@end
