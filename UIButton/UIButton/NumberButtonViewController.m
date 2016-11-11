//
//  NumberButtonViewController.m
//  UIButton
//
//  Created by Meng Fan on 16/11/10.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "NumberButtonViewController.h"
#import "NumberButton.h"

//https://github.com/jkpang/PPNumberButton

@interface NumberButtonViewController ()

@end

@implementation NumberButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"仿京东购物车商品的加减按钮";
    /**
     仿京东购物车商品的加减按钮这种效果可以通过button封装成自定义的view来实现
     */
    
    [self example1];
    [self example2];
    [self example3];
    [self example4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - setUpViews
//默认状态——无边框
- (void)example1 {
    NumberButton *numberButton = [[NumberButton alloc] initWithFrame:CGRectMake(100, 100, 110, 30)];
    
    //开启抖动动画
    numberButton.shakeAnimation = YES;
    numberButton.minValue = 2;
    numberButton.maxValue = 10;
    numberButton.numberBlock = ^(NSString *num) {
        NSLog(@"example 1 : %@", num);
    };
    
    [self.view addSubview:numberButton];
    
}

//边框状态
- (void)example2 {
    NumberButton *numberButton = [[NumberButton alloc] initWithFrame:CGRectMake(100, 160, 110, 30)];
    numberButton.borderColor = [UIColor grayColor];
    numberButton.numberBlock = ^(NSString *num) {
        NSLog(@"example 2 : %@", num);
    };
    [self.view addSubview:numberButton];
}

//自定义加减按钮的文字
- (void)example3 {
    
    NumberButton *numberButton = [[NumberButton alloc] initWithFrame:CGRectMake(100, 220, 110, 30)];
    numberButton.shakeAnimation = YES;
    //设置边框颜色
    numberButton.borderColor = [UIColor grayColor];
    //设置加减按钮的文字
    [numberButton settitleWithIncreseTitle:@"加" decreaseTitle:@"减"];
    numberButton.numberBlock = ^(NSString *num) {
        NSLog(@"example 3 : %@", num);
    };
    [self.view addSubview:numberButton];
}


//自定义加减按钮的背景图片
- (void)example4 {
    NumberButton *numberButton = [[NumberButton alloc] initWithFrame:CGRectMake(100, 300, 110, 30)];
    numberButton.shakeAnimation = YES;
    //设置边框颜色
//    numberButton.borderColor = [UIColor grayColor];
    //设置加减按钮的背景图片
    [numberButton setImageWithIncreaseImage:[UIImage imageNamed:@"timeline_relationship_icon_addattention"] decreaseImage:[UIImage imageNamed:@"decrease_highlight"]];
    numberButton.numberBlock = ^(NSString *num) {
        NSLog(@"example 4 : %@", num);
    };
    [self.view addSubview:numberButton];
}


#pragma mark -
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
