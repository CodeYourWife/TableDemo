//
//  ShopGuideModel.m
//  TableDemo
//
//  Created by jianghai on 15/9/18.
//  Copyright © 2015年 jianghai. All rights reserved.
//

#import "ShopGuideModel.h"

@implementation ShopGuideModel
/**
 *  "empty_id": "2",
 "suit_id": "22",
 "highImgUrl": "",
 "SuitStyle": "欧式",
 "expr_id": "1",
 "cityName": "成都",
 "districtName": "武侯区",
 "houseName": "蓝光金楠府",
 "userLoveNum": "123",
 "SuitPosition": "104.016653,30.625049",
 "designeDesc": "TESTTEST",
 "img_345_229": "",
 "img_576_382": "",
 "img_290_192": ""
 */
- (instancetype)initWithValues:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.propertyCount = [dict count];
        self.guideId = dict[@"guideId"];
        self.guideName = dict[@"guideName"];
        self.succeedOrderCount = dict[@"succeedOrderCount"];
        self.orderPrice = dict[@"orderPrice"];
        self.salePercent = dict[@"salePercent"];
        self.totalScore = dict[@"totalScore"];
        self.reciveOrderSequence = dict[@"reciveOrderSequence"];
        _dataArray = [NSArray arrayWithObjects:
                      self.guideId,
                      self.succeedOrderCount,
                      self.orderPrice,
                      self.salePercent,
                      self.totalScore,
                      self.reciveOrderSequence,nil];
    }
    return self;
}
@end
