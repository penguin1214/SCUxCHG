//
//  SellTabView.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 6/3/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SellTabViewDelegate <NSObject>

- (void)doClickChooseImageBtn;

@end

@interface SellTabView : UIView

@property (nonatomic, strong) UITextField* vNameText;
@property (nonatomic, strong) UITextView* vDiscText;
@property (nonatomic, strong) UITextField* vPriceText;
@property (nonatomic, strong) UITextField* vCategoryText;
@property (nonatomic, strong) UITextField* vQualityText;

@property (nonatomic, weak) id<SellTabViewDelegate> delegate;

- (void)refreshImage:(UIImage*)image;
- (void)reloadImageView;

@end
