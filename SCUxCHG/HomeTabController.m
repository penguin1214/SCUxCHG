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
    HomeTabSearchTableViewController* _cMainSearchTableViewController;
    
    NSArray* _mainViewArray;
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
    [self.navigationController setNavigationBarHidden:NO];
    
    _cMainSearchTableViewController = [[HomeTabSearchTableViewController alloc] init];
//    _cMainSearchTableViewController.tableView = [[UITableView alloc] initWithFrame:kScreenBound];
//    [self addChildViewController:_cMainSearchTableViewController];
    
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
        make.top.equalTo(self.view).with.offset(64);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(180);
        make.width.equalTo(self.view.mas_width);
    }];
    
    _vCategoryTableView = [[UITableView alloc] init];
    _vCategoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_vCategoryTableView];
    [_vCategoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(_vCycleScrollView.mas_bottom).with.offset(15);
        make.width.mas_equalTo(self.view.mas_width);
        make.height.equalTo(self.view);
    }];
    
    _vCategoryTableView.delegate = self;
    _vCategoryTableView.dataSource = self;
    _cMainSearchTableViewController.delegate = self;
    
    //    _mainViewArray = [[NSArray alloc] initWithObjects:_vCycleScrollView, _vCategoryTableView, nil];
    [self getData];
}

//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:YES];
//    NSLog(@"appear");
//}

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
}

#pragma mark - UITableViewDataSource

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    if (tableView == _vCategoryTableView) {
//        return 1;
//    }else{
//        return 2;
//    }
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _categories.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString* identifier = @"HomeTabCategoriesTableViewCell";
    HomeTabTableViewCell* cell = [_vCategoryTableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[HomeTabTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [_categories objectForKey:[@(indexPath.row + 1) stringValue]];
    return cell;
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
   [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.navigationController pushViewController:_cMainSearchTableViewController animated:YES];
}

#pragma mark - HomeTabSearchTableViewDelegate
-(void)parentViewControllerPop{
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController.navigationBar setHidden:NO];
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
