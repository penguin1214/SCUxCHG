//
//  HomeTabController.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/7/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"
#import "HomeTabSearchTableViewController.h"

@interface HomeTabController : BaseController <UITableViewDataSource, UITableViewDelegate, SDCycleScrollViewDelegate, UISearchBarDelegate, HomeTabSearchTableViewDelegate>

@end
