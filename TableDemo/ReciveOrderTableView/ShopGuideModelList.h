//
//  ShopGuideModelList.h
//  TableDemo
//
//  Created by jianghai on 15/9/20.
//  Copyright © 2015年 jianghai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopGuideModelList : NSObject
@property (nonatomic, retain)NSMutableArray *shopGuidePropertyList;//属性列表
@property (nonatomic, retain)NSMutableArray *shopGuideList;//请求返回的所有导购信息

-(instancetype)initWithValues:(NSDictionary*)dic;
@end
