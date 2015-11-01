//
//  ViewController.m
//  BezierPath
//
//  Created by WilliamZhang on 15/10/25.
//  Copyright © 2015年 WilliamZhang. All rights reserved.
//

#import "ViewController.h"
#import "HeartView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HeartView *heartView = [[HeartView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    [self.view addSubview:heartView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
