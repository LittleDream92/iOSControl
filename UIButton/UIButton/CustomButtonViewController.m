//
//  CustomButtonViewController.m
//  UIButton
//
//  Created by Meng Fan on 16/11/10.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "CustomButtonViewController.h"
#import "CustomButton.h"
#import "UIButton+Extern.h"

@interface CustomButtonViewController ()

@property (nonatomic, strong) CustomButton *customButton;

@end

@implementation CustomButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"自定义button";
    
    [self example1];
//    [self example2];
    
}

/**
    iOS的button是非常常用的控件，可以创建只有文字、只有图片的button，也可以自定义一些图文结合的复杂的button。
 通常在项目中，需要定制button的image和title的位置，我们可以自定义一个继承自UIButton的控件，
 在
 -(CGRect)imageRectForContentRect:(CGRect)contentRect中重置image的位置，
 在
 -(CGRect)titleRectForContentRect:(CGRect)contentRect中重置标题的位置。
 
 
 */

#pragma mark - setUpViews
/** 原生button */
- (void)example1 {
    /** button的样式
     // typedef enum {
     // UIButtonTypeCustom = 0, 自定义风格
     // UIButtonTypeRoundedRect, 圆角矩形
     // UIButtonTypeDetailDisclosure, 蓝色小箭头按钮，主要做详细说明用
     // UIButtonTypeInfoLight, 亮色感叹号
     // UIButtonTypeInfoDark, 暗色感叹号
     // UIButtonTypeContactAdd, 十字加号按钮
     // } UIButtonType;
     */
    
    /** button的状态
     // enum {
     // UIControlStateNormal = 0, 常规状态显现
     // UIControlStateHighlighted = 1 << 0, 高亮状态显现
     // UIControlStateDisabled = 1 << 1, 禁用的状态才会显现
     // UIControlStateSelected = 1 << 2, 选中状态
     // UIControlStateApplication = 0x00FF0000, 当应用程序标志时
     // UIControlStateReserved = 0xFF000000 为内部框架预留，可以不管他
     // };
     */
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(0, 100, 100, 100);
    //设置背景颜色
    button.backgroundColor = [UIColor brownColor];
    
    [button setImage:[UIImage imageNamed:@"Image"] forState:UIControlStateNormal];
    button.titleLabel.numberOfLines = 0;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitle:@"我是\n button" forState:UIControlStateNormal];
    
    //设置图片在上，文字在下
    //    [button verticalCenterImageAndTitle];
    [button horizontalCenterTitleAndImage:6.0];
    
    [self.view addSubview:button];
    
    
    //有时候我们要点击的button的范围／区域比我们想要显示出来的区域要大，此时怎么办呢,详细请参照button的分类
    [button setEnlargeEdgeWithTop:20 right:20 bottom:20 left:20];
    
    //有时候我们需要设置button圆形(这种情况一般button是正方形的)
    button.layer.cornerRadius = button.frame.size.height/2;
    button.clipsToBounds = YES;
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 1.0f;
    
    // 按钮发光
    button.showsTouchWhenHighlighted = YES;
    
    //设置点击方法
    [button addTarget:self action:@selector(nativeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

/** 自定义button */
- (void)example2 {
    [self.view addSubview:self.customButton];
}

#pragma mark - lazyloading

-(CustomButton *)customButton {
    if (!_customButton) {
        _customButton = [CustomButton buttonWithType:UIButtonTypeCustom];
        _customButton.frame = CGRectMake(100, 100, 100, 100);
        [_customButton addTarget:self action:@selector(customButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_customButton setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
        [_customButton setTitle:@"我是自定义按钮" forState:UIControlStateNormal];
        _customButton.backgroundColor = [UIColor cyanColor];
    }
    return _customButton;
}



#pragma mark - action
- (void)nativeButtonAction:(UIButton *)sender {
    NSLog(@"This is a native button");
}

- (void)customButtonAction:(CustomButton *)sender {
    NSLog(@"This is a custom Button");
}





#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
