//
//  ViewController.m
//  TableDemo
//
//  Created by jianghai on 15/9/18.
//  Copyright © 2015年 jianghai. All rights reserved.
//

#import "ViewController.h"
#import "ReciveOrderTableView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ReciveOrderTableView* tableView = [[ReciveOrderTableView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
    [self.view addSubview:tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
