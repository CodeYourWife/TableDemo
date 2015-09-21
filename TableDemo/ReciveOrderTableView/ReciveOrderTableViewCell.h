//
//  ReciveOrderTableViewCell.h
//  TableDemo
//
//  Created by jianghai on 15/9/18.
//  Copyright © 2015年 jianghai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopGuideModel.h"
@class ReciveOrderTableViewCell;
typedef void(^acceptOrderCallback)(ReciveOrderTableViewCell* cell ,ShopGuideModel* aModel);

@interface ReciveOrderTableViewCell : UITableViewCell
@property (nonatomic,assign)CGFloat cellHeight;

- (void)setHeaderCellWidthModel:(ShopGuideModel*)aModel tableWidth:(int)width;
- (void)setCellDataWidthModel:(ShopGuideModel*)aModel tableWidth:(int)width acceptOrderCallback:(acceptOrderCallback) callback;

@end
