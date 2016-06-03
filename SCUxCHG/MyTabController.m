//
//  MyTabController.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/9/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "MyTabController.h"
#import "MyTabHeaderCell.h"
#import "MyTabMyOrderCell.h"
#import "MyTabOrderItemCell.h"
#import "ProfileManager.h"


typedef enum{
    eSectionHeader = 0,
    eSectionSetting
}eSection;

@interface MyTabController(){
    UserLoginController* _cLoginController;
    UITableView *_vTableView;
    UserEntity* _user;
}

@end

@implementation MyTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"我的";
    self.navigationItem.leftBarButtonItem = nil;
    
    _cLoginController = [[UserLoginController alloc] init];
    _cLoginController.delegate = self;
    
    _vTableView = [[UITableView alloc] initWithFrame:[self.view bounds]];
    _vTableView.tableFooterView = [[UIView alloc] init];
    _vTableView.dataSource = self;
    _vTableView.delegate = self;
    [self.view addSubview:_vTableView];
    [_vTableView mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(self.view);
        make.width.equalTo(self.view);
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    if (_user) {
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"退出"
                                                                        style:UIBarButtonItemStyleDone target:nil action:nil];
        rightButton.tintColor = kColorMainRed;
        self.navigationItem.rightBarButtonItem = rightButton;
        self.navigationItem.rightBarButtonItem.target = self;
        //退出
        self.navigationItem.rightBarButtonItem.action = @selector(logout);
    }else{
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"登录"
                                                                        style:UIBarButtonItemStyleDone target:nil action:nil];
        rightButton.tintColor = kColorMainRed;
        self.navigationItem.rightBarButtonItem = rightButton;
        self.navigationItem.rightBarButtonItem.target = self;
        self.navigationItem.rightBarButtonItem.action = @selector(loadLoginViewController);
    }
    
    [_vTableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegaet

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [MyTabHeaderCell height];
    }else{
        return 44;
    }
}

#pragma mark - UITableviewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 10;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else{
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* identifier;
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    //eSectionHeader
    if (section == eSectionHeader) {
        identifier = @"MyTabHeaderCell";
        MyTabHeaderCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[MyTabHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        //        fill cell with data
        [cell fillContentWithUser:_user];
        return cell;
    }else{  //eSectionSetting
        if (row == 0) {
            identifier = @"MyTabMyOrderCell";
            MyTabMyOrderCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[MyTabMyOrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier imageNamed:@"icon_my_order" title:@"我的订单"];
            }
            return cell;
        }else{
            identifier = @"MyTabOrderItemCell";
            MyTabOrderItemCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[MyTabOrderItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                cell.delegate = self;
            }
            return cell;
        }
    }
}

#pragma mark - MyTabOrderItemCellDelegate

- (void)doGotoOrderListPageWithListStatus:(NSString *)Status{
    if ([self gotoLoginPageIfNotLogin]) {
        return;
    }
    
    //    order list controller
}

#pragma mark - UserLoginControllerDelegate
-(void)getUser:(UserEntity *)user{
    _user = user;
}

#pragma mark - User
- (void)loadLoginViewController{
    [self.navigationController pushViewController:_cLoginController animated:YES];
}

-(void)refreshUser:(UserEntity *)user{
    _user = user;
}

- (void)logout{
    [[ProfileManager sharedInstance] logout];
    _user = nil;
    [self loadLoginViewController];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
