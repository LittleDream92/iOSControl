//
//  TagViewController.m
//  UILabel
//
//  Created by Meng Fan on 16/11/21.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "TagViewController.h"
#import "TagView.h"

/**
    封装的标签视图，主要曹勇代理和block的方式
 */

@interface TagViewController ()

@end

@implementation TagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"选择标签";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
