//
//  SellTabController.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/19/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "BaseController.h"
#import "DownPicker.h"
#import "SellTabView.h"

@interface SellTabController : BaseController<UITextFieldDelegate, UITextViewDelegate, SellTabViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) DownPicker* categoryDownPicker;
@property (nonatomic, strong) DownPicker* qualityDownPicker;

@end
