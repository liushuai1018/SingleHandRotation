//
//  ViewController.m
//  单指转盘
//
//  Created by 铂隆资产1号 on 16/5/16.
//  Copyright © 2016年 铂隆资产. All rights reserved.
//

#import "ViewController.h"
#import "LS_TpoUp_View.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self createrSubView];
}

- (void)createrSubView
{
    LS_TpoUp_View *topUp = [[LS_TpoUp_View alloc] initWithFrame:self.view.bounds];
    self.view = topUp;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
