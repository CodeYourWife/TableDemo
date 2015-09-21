//
//  ShopGuideModel.h
//  TableDemo
//
//  Created by jianghai on 15/9/18.
//  Copyright © 2015年 jianghai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopGuideModel : NSObject

@property (nonatomic, assign)NSUInteger propertyCount;    //导购属性个数
@property (nonatomic, copy)NSString* guideId;             //导购id
@property (nonatomic, copy)NSString* guideName;
@property (nonatomic, copy)NSString* succeedOrderCount;   //成单率
@property (nonatomic, copy)NSString* orderPrice;          //订单价格
@property (nonatomic, copy)NSString* salePercent;              //销售占比
@property (nonatomic, copy)NSString* totalScore;          //总分
@property (nonatomic, copy)NSString* reciveOrderSequence; //接单顺序

@property (nonatomic, retain)NSArray* dataArray;//test

- (instancetype)initWithValues:(NSDictionary *)dict;
@end
