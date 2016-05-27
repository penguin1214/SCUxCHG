//
//  HomeTabSearchTableViewController.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/27/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "HomeTabSearchTableViewController.h"

@interface HomeTabSearchTableViewController (){
    UISearchController* _cSearchController;
    UITableViewController* _cSearchResultTableViewController;
}
@end

@implementation HomeTabSearchTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
        _cSearchController = [[UISearchController alloc] initWithSearchResultsController:_cResultTableViewController];
        [self addChildViewController:_cSearchController];
        [_cSearchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = _cSearchController.searchBar;
}
@end
