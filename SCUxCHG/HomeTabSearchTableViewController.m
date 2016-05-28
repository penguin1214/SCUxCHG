//
//  HomeTabSearchTableViewController.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/27/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "HomeTabSearchTableViewController.h"
#import "ProductModel.h"

@interface HomeTabSearchTableViewController (){
    UISearchController* _cSearchController;
    UITableViewController* _cSearchResultTableViewController;
    NSArray* _allProductsIdsAndNamesPairs;
    NSMutableArray* _filteredProducts;
}
@end

@implementation HomeTabSearchTableViewController

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:kScreenBound];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _cSearchResultTableViewController = [[UITableViewController alloc] init];
//    _cSearchResultTableViewController.tableView = [[UITableView alloc] initWithFrame:kScreenBound];
    
    NSLog(@"%@ \n %@", self.view, self.tableView);
//    _cSearchController = [[UISearchController alloc] initWithSearchResultsController:_cSearchResultTableViewController];
    _cSearchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    [_cSearchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = _cSearchController.searchBar;
    self.tableView.tableFooterView = [[UIView alloc]init]; //去掉多余的空行分割线
    NSLog(@"%@", self.tableView.tableHeaderView);
    [_cSearchController.searchBar setShowsCancelButton:YES];
    
//    _cSearchResultTableViewController.tableView.delegate = self;
//    _cSearchResultTableViewController.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    _cSearchController.searchBar.delegate = self;
    _cSearchController.searchResultsUpdater = self;
    
    self.definesPresentationContext = YES;
    
    [self getData];
    return self;
}


-(void)viewDidLoad{
//    NSLog(@"loading view");
//    [super viewDidLoad];
//    
//    [self getData];
}

//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:YES];
//    NSLog(@"appear");
//}

- (void)getData{
    [ProductModel getAllProductsIdsAndNamesDictionarySuccess:^(BOOL result, NSString* message, NSArray* allProductsIdsAndNamesPaires){
        if (!result) {
            _allProductsIdsAndNamesPairs = allProductsIdsAndNamesPaires;
            NSLog(@"%@", _allProductsIdsAndNamesPairs);
            [self.tableView reloadData];
        }else{
            NSLog(@"%@", message);
        }
    }failure:^(NSError* error){
    }];
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        if (!_cSearchController.active) {
            return 0;
        }else{
            return _filteredProducts.count;
        }
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* identifier = @"HomeTabMainSearchTableView";
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"搜索 %@", _cSearchController.searchBar.text];
    }else{
        cell.textLabel.text = [_filteredProducts objectAtIndex:indexPath.row];
    }
    return cell;
}

#pragma mark - UISearchResultUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    [_filteredProducts removeAllObjects];
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", _cSearchController.searchBar.text];
    
    _filteredProducts = [[_allProductsIdsAndNamesPairs filteredArrayUsingPredicate:searchPredicate] mutableCopy];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}
@end

