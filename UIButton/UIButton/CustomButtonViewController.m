//
//  CustomButtonViewController.m
//  UIButton
//
//  Created by Meng Fan on 16/11/10.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "CustomButtonViewController.h"
#import "CustomButton.h"

@interface CustomButtonViewController ()

@property (nonatomic, strong) CustomButton *customButton;
@property (nonatomic, strong) UIButton *nativeButton;

@end

@implementation CustomButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"自定义button";
    
    [self setUpViews];
}

/**
    iOS的button是非常常用的控件，可以创建只有文字、只有图片的button，也可以自定义一些图文结合的复杂的button。
 */

#pragma mark - setUpViews
- (void)setUpViews {
    [self.view addSubview:self.customButton];
    [self.view addSubview:self.nativeButton];
}

#pragma mark - lazyloading
-(CustomButton *)customButton {
    if (!_customButton) {
        _customButton = [CustomButton buttonWithType:UIButtonTypeCustom];
        _customButton.frame = CGRectMake(100, 100, 100, 100);
        [_customButton addTarget:self action:@selector(customButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_nativeButton setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
        [_customButton setTitle:@"我是\n自定义按钮" forState:UIControlStateNormal];
        _customButton.backgroundColor = [UIColor cyanColor];
    }
    return _customButton;
}

-(UIButton *)nativeButton {
    if (!_nativeButton) {
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
         //以下是几种状态
         // enum {
            // UIControlStateNormal = 0, 常规状态显现
            // UIControlStateHighlighted = 1 << 0, 高亮状态显现
            // UIControlStateDisabled = 1 << 1, 禁用的状态才会显现
            // UIControlStateSelected = 1 << 2, 选中状态
            // UIControlStateApplication = 0x00FF0000, 当应用程序标志时
            // UIControlStateReserved = 0xFF000000 为内部框架预留，可以不管他
         // };
         */
        _nativeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nativeButton.frame = CGRectMake(100, 200+10, 0, 0);
        [_nativeButton addTarget:self action:@selector(nativeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _nativeButton.titleLabel.numberOfLines = 0;
        _nativeButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_nativeButton setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
        [_nativeButton setTitle:@"我是\n原生按钮" forState:UIControlStateNormal];
        [_nativeButton sizeToFit];
        _nativeButton.backgroundColor = [UIColor greenColor];
        
        // 按钮发光
        _nativeButton.showsTouchWhenHighlighted = YES;

        
//        _nativeButton.imageView.frame
    }
    return _nativeButton;
}


#pragma mark - action
- (void)customButtonAction:(CustomButton *)sender {
    NSLog(@"This is a custom Button");
}

- (void)nativeButtonAction:(UIButton *)sender {
    NSLog(@"This is a native button");
}



#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
