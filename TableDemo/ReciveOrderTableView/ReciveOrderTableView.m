//
//  ReciveOrderTableView.m
//  TableDemo
//
//  Created by jianghai on 15/9/18.
//  Copyright © 2015年 jianghai. All rights reserved.
//

#import "ReciveOrderTableView.h"
#import "ReciveOrderTableViewCell.h"
@interface ReciveOrderTableView ()<UITableViewDelegate , UITableViewDataSource>

@end

@implementation ReciveOrderTableView

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self == [super initWithFrame:frame])
    {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    [dic setValue:@"dsfdsfds" forKey:@"guideId"];
    [dic setValue:@"李丹李丹李" forKey:@"guideName"];
    [dic setValue:@"sss" forKey: @"succeedOrderCount"];
    [dic setValue:@"ddd" forKey:@"orderPrice"];
    [dic setValue:@"s5f" forKey:@"salePercent"];
    [dic setValue:@"sdfadsf" forKey:@"totalScore"];
    [dic setValue:@"kkkk" forKey:@"reciveOrderSequence"];
    
    
    NSString* cellReuseId = @"ReciveOrderTableViewCell";
    ReciveOrderTableViewCell *pCell = [tableView dequeueReusableCellWithIdentifier:cellReuseId];
    if(pCell == nil){
        pCell = [[ReciveOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseId];
    }
    [pCell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [pCell setCellDataWidthModel:[[ShopGuideModel alloc] initWithValues:dic]
                      tableWidth:tableView.frame.size.width
             acceptOrderCallback:^(ReciveOrderTableViewCell *cell, ShopGuideModel *aModel){
                 
        NSLog(@"Name:%@",aModel.guideName);
    }];
    return pCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReciveOrderTableViewCell *cell = (ReciveOrderTableViewCell*) [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.cellHeight;
}
@end
