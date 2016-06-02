//
//  UserRegStep3Controller.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 6/1/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "UserRegStep3Controller.h"
#import "UserRegStep3View.h"

@interface UserRegStep3Controller (){
    UserRegStep3View* _vRegViewStep3;
    UIPickerView* _vCampusPickerView;
    NSMutableArray* _campusArray;
    NSString* _username;
    NSString* _password;
    NSString* _phone;
    NSInteger _campus;
}

@end
@implementation UserRegStep3Controller
/**
 *  填写其他信息。
 */

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    _campus = 0;
    self.view = [[UIView alloc] initWithFrame:kScreenBound];
    _campusArray = [NSMutableArray arrayWithArray:@[@"江安", @"望江", @"华西"]];
    _vCampusPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 200, self.view.frame.size.width, 200)];
    _vCampusPickerView.delegate = self;
    _vCampusPickerView.dataSource = self;
 
    _vRegViewStep3.delegate = self;
    
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.title = @"注册";
    
    _vRegViewStep3 = [[UserRegStep3View alloc] initWithFrame:kScreenBound];
    _vRegViewStep3.delegate = self;
    
    [self.view addSubview:_vRegViewStep3];
    [_vRegViewStep3 mas_makeConstraints:^(MASConstraintMaker* make){
//        make.top.equalTo(self.view).with.offset(64);
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    [self.view addSubview:_vCampusPickerView];
    [_vCampusPickerView mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.view);
    }];
}

#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _campusArray.count;
}

#pragma mark - UIPickerViewDelegate
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return self.view.frame.size.width;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}

//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    return _campusArray[row];
//}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _campus = row;
//    [self toast:[NSString stringWithFormat:@"%ld", row]];
}

-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString* title;
    title = _campusArray[row];
    UIFont* font = [UIFont systemFontOfSize:12];
    NSDictionary* attributes = @{NSFontAttributeName:font};
    
    return [[NSAttributedString alloc] initWithString:title attributes:attributes];
}

#pragma mark - Refreshing Data
-(void)refreshUsername:(NSString *)username andPhone:(NSString *)phone andPassword:(NSString *)pwd{
    _username = [NSString stringWithString:username];
    _phone = [NSString stringWithString:phone];
    _password = [NSString stringWithString:pwd];
}

#pragma mark - UserRegStep3Delegate
-(void)doClickNextBtn{
    if (!_campus) {
        _campus = 0;
    }
    [UserModel addNewUserOfUsername:_username andPhone:_phone andPassword:_password andCampus:_campus success:^(BOOL result, NSString* message, UserEntity* user){
        if (!result) {
            [self toast:@"注册成功！"];
            sleep(2);
            [self.delegate backToStep2Controller];
        }else{
            [self toast:@"失败"];
            NSLog(@"%@", message);
        }
    }failure:^(NSError* error){
        NSLog(@"%@", error);
    }];
}
@end
