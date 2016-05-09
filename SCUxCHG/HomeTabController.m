//
//  HomeTabController.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/7/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "HomeTabController.h"
#import "HomeTabRightTableViewCell.h"

@interface HomeTabController () {
    UITableView *_rightTableView;
    UITableView *_leftTableView;
    CGFloat _leftTableWidth;
}

@end

@implementation HomeTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = nil;
    self.title = @"SCUxCHG";
    
    _leftTableWidth = 100.f;
    
    //left table view to display product catagories
    _leftTableView = [[UITableView alloc] init];
    _leftTableView.tableFooterView = [[UIView alloc] init];
    _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_leftTableView];
    [_leftTableView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.width.mas_equalTo(_leftTableWidth);
        make.height.equalTo(self.view);
    }];
    
    _leftTableView.dataSource = self;
    _leftTableView.delegate = self;
    
    //right table view
    _rightTableView = [[UITableView alloc] init];
    _rightTableView.tableFooterView = [[UIView alloc] init];    //在table下方显示空白view
    _rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_rightTableView];
    [_rightTableView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_leftTableView.mas_right);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view).with.offset(64);    //???
        make.height.equalTo(self.view).with.offset(-112);
    }];
    
    _rightTableView.dataSource = self;
    _rightTableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _leftTableView) {
        NSString *identifier = @"leftTableViewCell";
        UITableViewCell *cell = [_leftTableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = @"leftTableCell";
        return cell;
        
    }else{
        NSString *identifier = @"rightTableViewCell";
        HomeTabRightTableViewCell *cell = [_rightTableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[HomeTabRightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell fillContentWithProduct];
        return cell;
    }
}

#pragma mark - UITableViewDelegate


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
