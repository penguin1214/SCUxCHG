//
//  DetailViewController.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 4/23/16.
//  Copyright (c) 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

