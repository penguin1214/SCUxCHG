//
//  HomeTabTableViewCell.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/25/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "HomeTabTableViewCell.h"

@interface HomeTabTableViewCell (){
    UILabel* _vCategoryLable;
}

@end

@implementation HomeTabTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.textLabel.font = [UIFont fontWithName:@"Arial" size:13.0];
    return self;
}
@end
