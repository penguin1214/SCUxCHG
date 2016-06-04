//
//  SellTabController.m
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/19/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "SellTabController.h"
#import "SellTabView.h"
#import "CategoryModel.h"

@interface SellTabController (){
    SellTabView* _vSellTabView;
    NSArray* _categoryArray;
    NSArray* _qualityArray;
}

@end

@implementation SellTabController

@synthesize categoryDownPicker = _categoryDownPicker;
@synthesize qualityDownPicker  = _qualityDownPicker;

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.navigationItem.leftBarButtonItem = nil;
    self.title = @"我要卖";
    self.view = [[UIView alloc] initWithFrame:kScreenBound];
    
    [CategoryModel getCategories:^(BOOL result, NSString* message, NSDictionary* categories){
        if (!result) {
            _categoryArray = categories.allValues;
            NSLog(@"%@", _categoryArray);
        }
    }failure:^(NSError* error){
        NSLog(@"%@", error);
    }];
    
    _qualityArray = [NSArray arrayWithObjects:@"一成新",@"两成新", @"三成新", @"四成新", @"五成新", @"六成新", @"七成新", @"八成新", @"九成新", @"全新", nil];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    _vSellTabView = [[SellTabView alloc] initWithFrame:kScreenBound];
    [self.view addSubview:_vSellTabView];
    [_vSellTabView mas_makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.view).with.offset(64);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    [_vSellTabView reloadImageView];
    
    _vSellTabView.vNameText.delegate = self;
    _vSellTabView.vDiscText.delegate = self;
    
    _vSellTabView.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated{
    _categoryDownPicker = [[DownPicker alloc] initWithTextField:_vSellTabView.vCategoryText withData:_categoryArray];
    [_categoryDownPicker setPlaceholder:@" 请选择商品类别"];
    
    _qualityDownPicker = [[DownPicker alloc] initWithTextField:_vSellTabView.vQualityText withData:_qualityArray];
    [_qualityDownPicker setPlaceholder:@" 请选择商品成色"];
    
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.placeholder = nil;
    [textField becomeFirstResponder];

}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField.text isEqualToString:@""]) {
        textField.text = @"请输入商品名";
    }
}

#pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"请输入商品描述"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"请输入商品描述";
        textView.textColor = [UIColor lightGrayColor]; //optional
    }
    [textView resignFirstResponder];
}

#pragma mark - SellTabViewDelegate
-(void)doClickChooseImageBtn{
    UIImagePickerController* imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

#pragma mark - UIImagePickerController
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [_vSellTabView refreshImage:image];
    [_vSellTabView reloadImageView];
}
@end
