//
//  HomeTabCategoryController.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/25/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "BaseController.h"

@interface HomeTabCategoryController : BaseController <UITableViewDataSource, UITableViewDelegate>

-(instancetype)initWithCategoryId:(NSInteger)categoryId andCategoryName:(NSString*)categoryName;

@end
