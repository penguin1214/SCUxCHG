//
//  HomeTabCategoryController.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/25/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "HomeTabCategoryController.h"
#import "CategoryModel.h"
#import "ProductModel.h"
#import "ProductTableViewCell.h"

@interface HomeTabCategoryController (){
    NSInteger _categoryId;
    NSString* _categoryName;
    NSArray* _productIds;
    NSMutableArray* _products;
    UITableView* _vProductsTableView;
}

@end

@implementation HomeTabCategoryController 

-(instancetype)initWithCategoryId:(NSInteger)categoryId andCategoryName:(NSString*)categoryName{
    self = [super init];
    if (!self) {
        return nil;
    }
    _categoryId = categoryId;
    _categoryName = categoryName;
    _products = [[NSMutableArray alloc] init];
    
    [ProductModel getProductsIdOfCategory:_categoryId success:^(BOOL result, NSString* message, NSArray* productIds){
        if (!result) {
            _productIds = productIds;
            [self getData];
        }else{
            [self toast:message];
        }
    }failure:^(NSError* error){
        NSLog(@"%@", error);
    }];
    return self;
}

-(void)viewDidLoad{
    NSLog(@"loading view");
    [super viewDidLoad];
    self.title = _categoryName;
    
    _vProductsTableView = [[UITableView alloc] init];
    _vProductsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:_vProductsTableView];
    [_vProductsTableView mas_makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.width.mas_equalTo(self.view.mas_width);
        make.height.equalTo(self.view);
    }];
    _vProductsTableView.delegate = self;
    _vProductsTableView.dataSource = self;
    
//    [self getData];
}

- (void)getData{
    NSLog(@"getting data...");
    NSLog(@"productIds: %@", _productIds);
    for (NSNumber* proId in _productIds) {
        [ProductModel getProductWithId:[proId integerValue] success:^(BOOL result, NSString* message, ProductEntity* product){
            if (!result) {
                [_products addObject:product];
                [_vProductsTableView reloadData];
            }else{
                [self toast:message];
            }
        }failure:^(NSError* error){
            NSLog(@"%@", error);
        }];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _products.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* identifier = @"HomeTabCategoryProductTableViewcell";
    ProductTableViewCell* cell = [_vProductsTableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    [cell fillContentWithProduct:_products[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ProductTableViewCell height];
}

@end
