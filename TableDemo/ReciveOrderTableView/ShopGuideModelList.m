//
//  ShopGuideModelList.m
//  TableDemo
//
//  Created by jianghai on 15/9/20.
//  Copyright © 2015年 jianghai. All rights reserved.
//

#import "ShopGuideModelList.h"
#import "ShopGuideModel.h"

@implementation ShopGuideModelList

-(instancetype)initWithValues:(NSDictionary*)dic
{
    self = [super init];
    if (self) {
        
        NSDictionary* property = dic[@"property"];
        NSArray* modelArray = dic[@"guidelist"];
        
        if ([dic isKindOfClass:[NSDictionary class]]) {
            
            if (dic && dic.count > 0) {
                
                
                NSMutableArray *guidePropertyList = [NSMutableArray arrayWithCapacity:property.count];
                for (NSDictionary *dic in modelArray) {
                    ShopGuideModel *item = [[ShopGuideModel alloc] initWithValues:dic];
                    [guideList addObject:item];
                }
                self.shopGuideList = guideList;
                
                NSMutableArray *guideList = [NSMutableArray arrayWithCapacity:modelArray.count];
                for (NSDictionary *dic in modelArray) {
                    ShopGuideModel *item = [[ShopGuideModel alloc] initWithValues:dic];
                    [guideList addObject:item];
                }
                self.shopGuideList = guideList;
            }
        }
    }
    return self;
}

@end
