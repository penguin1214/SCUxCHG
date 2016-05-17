//
//  MyTabOrderItemCell.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/17/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyTabOrderItemCellDelegate <NSObject>

- (void)doGotoOrderListPageWithListStatus:(NSString*)Status;

@end
@interface MyTabOrderItemCell : UITableViewCell

@property (nonatomic, weak) id<MyTabOrderItemCellDelegate> delegate;

@end
