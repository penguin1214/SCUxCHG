//
//  HomeTabSearchTableViewController.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/27/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeTabSearchTableViewDelegate <NSObject>

- (void)parentViewControllerPop;

@end

@interface HomeTabSearchTableViewController : UITableViewController<UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak) id <HomeTabSearchTableViewDelegate> delegate;

@end

