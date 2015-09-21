//
//  ReciveOrderTableViewCell.m
//  TableDemo
//
//  Created by jianghai on 15/9/18.
//  Copyright © 2015年 jianghai. All rights reserved.
//

#import "ReciveOrderTableViewCell.h"

#define Color_SpecialRow  [UIColor colorWithRed:253.f/255.f green:196.f/255.f blue:10.f/255.f alpha:1.f]
#define TableBorderColor  [UIColor grayColor]

@interface ReciveOrderTableViewCell ()
@property (nonatomic,copy)acceptOrderCallback reciveCallBack;
@property (nonatomic,retain)ShopGuideModel* mode;
@end

@implementation ReciveOrderTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.cellHeight = 0.0f;
    }
    return self;
}
- (void)setCellDataWidthModel:(ShopGuideModel*)aModel
                   tableWidth:(int) width
          acceptOrderCallback:(acceptOrderCallback) callback
{
    self.reciveCallBack = callback;
    self.mode = aModel;
    
    CGFloat itemWidth = width/((aModel.propertyCount + 1 )*1.0);
    
    //计算内容最大高度
    [aModel.dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
        UILabel* textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, itemWidth, 100)];
        textLabel.text = (NSString*)obj;
        CGFloat realLabelHeight = [self calcLabelHeight:textLabel];
        if(realLabelHeight > self.cellHeight)
            self.cellHeight = realLabelHeight;
    }];
    
    //添加内容
    for (int i = 0 ; i != aModel.dataArray.count + 1; i++)
    {
        //背景view
        UIView* backgroundView = [[UIView alloc] initWithFrame:CGRectMake(i * itemWidth, 0, itemWidth, self.cellHeight)];
        backgroundView.layer.borderWidth = 0.5;
        backgroundView.layer.borderColor = TableBorderColor.CGColor;
        if(i == 5)
            backgroundView.backgroundColor = Color_SpecialRow;
        //按钮
        if(i == aModel.dataArray.count){
            UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(itemWidth * .2f, self.cellHeight/2 - itemWidth * .3f, itemWidth*.6, itemWidth*.6);
            btn.backgroundColor = [UIColor redColor];
            [btn setTitle:@"接单" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [backgroundView addSubview:btn];
        }else{
            //内容
            UILabel* textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, itemWidth, 100)];
            textLabel.text = [aModel.dataArray objectAtIndex:i];
            [backgroundView addSubview:textLabel];
            
            CGFloat realLabelHeight = [self calcLabelHeight:textLabel];
            //内容在竖直方向居中
            textLabel.frame = CGRectMake(0, (self.cellHeight - realLabelHeight)/2, textLabel.frame.size.width, realLabelHeight);
        }
        [self addSubview:backgroundView];
    }
}

- (CGFloat)calcLabelHeight:(UILabel*) label
{
    label.textAlignment = NSTextAlignmentCenter;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    
    //自适应高度
    CGRect frame = label.frame;
    CGFloat labelHeight = [label.text boundingRectWithSize:
                                                    CGSizeMake(frame.size.width, CGFLOAT_MAX)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:[NSDictionary dictionaryWithObjectsAndKeys:label.font,
                                                            NSFontAttributeName, nil] context:nil].size.height;
    return labelHeight;
}

- (void)buttonClicked:(UIButton*)sender
{
    self.reciveCallBack(self,self.mode);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
