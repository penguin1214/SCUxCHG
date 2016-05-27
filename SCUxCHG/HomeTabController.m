//
//  HomeTabController.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/7/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "HomeTabController.h"
//#import "HomeTabRightTableViewCell.h"
#import "HomeTabTableViewCell.h"
#import "HomeTabCategoryController.h"
#import "CategoryModel.h"
#import "HomeTabSearchTableViewController.h"
#import "ProductModel.h"

typedef NS_ENUM(NSUInteger, SEARCH_VIEW_STATUS) {
    SEARCHVIEWHIDDEN = 0,
    SEARCHVIEWSHOW
};

@interface HomeTabController () {
    //    UITableView *_rightTableView;
    //    UITableView *_leftTableView;
    //    CGFloat _leftTableWidth;
    UITableView* _vCategoryTableView;
    SDCycleScrollView* _vCycleScrollView;
    NSDictionary* _categories;
    UITableView* _vMainSearchTableView;
    UISearchController* _cSearchController;
    UITableViewController* _vSearchResultTalbeViewController;
    NSArray* _mainViewArray;
    
    NSArray* _allProductsIdsAndNamesPairs;
    NSMutableArray* _filteredProducts;
}

@end

@implementation HomeTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = nil;
    self.title = @"SCUxCHG";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Search"
                                                                    style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
    self.navigationItem.rightBarButtonItem.target = self;
    self.navigationItem.rightBarButtonItem.action = @selector(didClickSearchBtn:);
    
    _cSearchController = [[UISearchController alloc] initWithSearchResultsController:_vSearchResultTalbeViewController];
    [self addChildViewController:_cSearchController];
    [_cSearchController.searchBar sizeToFit];
    [_cSearchController.searchBar setShowsCancelButton:YES];

    _vMainSearchTableView = [[UITableView alloc] init];
    _vMainSearchTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _vMainSearchTableView.tableHeaderView = _cSearchController.searchBar;
    
//    NSLog(@"self.tableView = %@, self.tableView.tableHeaderView = %@", _vMainSearchTableView, _vMainSearchTableView.tableHeaderView);
    
    [self.view addSubview:_vMainSearchTableView];
    [_vMainSearchTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
//        make.top.equalTo(self.view);
        make.width.mas_equalTo(self.view);
        make.height.equalTo(self.view);
    }];
    
    _vMainSearchTableView.delegate = self;
    _vMainSearchTableView.dataSource = self;
    _vMainSearchTableView.hidden = YES;
 
    
    // 网络加载图片的轮播器
    _vCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, 0, 0) delegate:self placeholderImage:[UIImage imageNamed:@"checked"]];
    NSMutableString* url = [NSMutableString stringWithString:kUrlBase];
    [url appendString:@"activityImgArray"];
    
    __block NSArray* imgarr;
    [[HTTPUtil sharedInstance] getImageArrayFromURL:url success:^(NSArray* array){
        imgarr = [NSArray arrayWithArray:array];
        _vCycleScrollView.imageURLStringsGroup = imgarr;
    }failure:^(NSError* error){
        NSLog(@"%@", error);
    }];
    
    [self.view addSubview:_vCycleScrollView];
    [_vCycleScrollView mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(180);
        make.width.equalTo(self.view.mas_width);
    }];
    
    _vCategoryTableView = [[UITableView alloc] init];
    _vCategoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _vCategoryTableView.delegate = self;
//    _vCategoryTableView.dataSource = self;
    [self.view addSubview:_vCategoryTableView];
    [_vCategoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(_vCycleScrollView.mas_bottom).with.offset(15);
        make.width.mas_equalTo(self.view.mas_width);
        make.height.equalTo(self.view);
    }];
    
    _vCategoryTableView.delegate = self;
    _vCategoryTableView.dataSource = self;
    
    _mainViewArray = [[NSArray alloc] initWithObjects:_vCycleScrollView, _vCategoryTableView, nil];
    
    [self getData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
/**
 *  Get data for category table.
 */
- (void)getData{
    __weak typeof (self) weakSelf = self;
    [weakSelf showLoadingView];
    
    [CategoryModel getCategories:^(BOOL result, NSString *message, NSDictionary *categories) {
        if (!result) {
            _categories = categories;
//            [_vCategoryTableView reloadData];
        }else{
            [weakSelf toast:message];
        }
        [weakSelf hideLoadingView];
        [_vCategoryTableView reloadData];
        
    } failure:^(NSError* error){
        if ([error.domain isEqualToString:NSURLErrorDomain] && error.code == NSURLErrorNotConnectedToInternet) {
            [weakSelf showNetworkBrokenView:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view.mas_left);
                make.right.equalTo(self.view.mas_right);
                make.top.equalTo(self.view).with.offset(64);
                make.height.equalTo(self.view).with.offset(-112);
            }];
        } else {
            [weakSelf toastWithError:error];
        }
        [weakSelf hideLoadingView];
    }];
    
    [ProductModel getAllProductsIdsAndNamesDictionarySuccess:^(BOOL result, NSString* message, NSArray* allProductsIdsAndNamesPaires){
        if (!result) {
            _allProductsIdsAndNamesPairs = allProductsIdsAndNamesPaires;
            NSLog(@"%@", _allProductsIdsAndNamesPairs);
        }else{
            [weakSelf toast:message];
        }
    }failure:^(NSError* error){
        if ([error.domain isEqualToString:NSURLErrorDomain] && error.code == NSURLErrorNotConnectedToInternet) {
            [weakSelf showNetworkBrokenView:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view.mas_left);
                make.right.equalTo(self.view.mas_right);
                make.top.equalTo(self.view).with.offset(64);
                make.height.equalTo(self.view).with.offset(-112);
            }];
        } else {
            [weakSelf toastWithError:error];
        }
        [weakSelf hideLoadingView];
 
    }];
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == _vCategoryTableView) {
        return 1;
    }else{
        return 2;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _vCategoryTableView) {
       return _categories.count;
    }else{
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
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _vCategoryTableView) {
        NSString* identifier = @"HomeTabCategoriesTableViewCell";
        HomeTabTableViewCell* cell = [_vCategoryTableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[HomeTabTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell.textLabel.text = [_categories objectForKey:[@(indexPath.row + 1) stringValue]];
        return cell;
    }else{
        NSString* identifier = @"HomeTabMainSearchTableView";
        UITableViewCell* cell = [_vMainSearchTableView dequeueReusableCellWithIdentifier:identifier];
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
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _vCategoryTableView) {
        NSInteger cateid = indexPath.row + 1;
        HomeTabCategoryController* categoryController = [[HomeTabCategoryController alloc] initWithCategoryId:cateid andCategoryName:[_categories objectForKey: [@(indexPath.row + 1) stringValue]]];
        [self.navigationController pushViewController:categoryController animated:YES];
    }
}

#pragma mark - Search View

-(IBAction)didClickSearchBtn:(id)sender
{
//    HomeTabSearchTableViewController* searchController = [[HomeTabSearchTableViewController alloc] init];
//    [self.navigationController pushViewController:searchController animated:YES];
    for (UIView* view in _mainViewArray) {
        if (view) {
            view.hidden = YES;
        }
    }
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    _vMainSearchTableView.hidden = NO;
}

#pragma mark - UISearchResultUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    [_filteredProducts removeAllObjects];
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", _cSearchController.searchBar.text];
    
    _filteredProducts = [[_allProductsIdsAndNamesPairs filteredArrayUsingPredicate:searchPredicate] mutableCopy];
    dispatch_async(dispatch_get_main_queue(), ^{
        [_vSearchResultTalbeViewController.tableView reloadData];
    });
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
