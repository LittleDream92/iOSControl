//
//  TextColorsViewController.m
//  UILabel
//
//  Created by Meng Fan on 16/11/9.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "TextColorsViewController.h"
#import "WSShiningLabel.h"

@interface TextColorsViewController ()

/** 多颜色 */
@property (nonatomic, strong) UILabel *label;


/** 闪烁 */
@property (nonatomic, strong) WSShiningLabel *shimmerLabel1;


@end

@implementation TextColorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"字体多种颜色及闪烁";
    
    [self example1];
    [self example2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)example1 {
    [self.view addSubview:self.label];
    
    //设置颜色
    NSString *colorText2 = @"我是其他颜色";
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithString:self.label.text];
    NSRange colorRange2 = NSMakeRange([[textString string] rangeOfString:colorText2].location, [[textString string] rangeOfString:colorText2].length);
    [textString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:colorRange2];
    
    NSString *colorText = @"哈哈哈哈！";
    NSRange colorRange = NSMakeRange([[textString string] rangeOfString:colorText].location, [[textString string] rangeOfString:colorText].length);
    [textString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:colorRange];
    
    self.label.attributedText = textString;
    [self.label sizeToFit];
}

- (void)example2 {
    [self.view addSubview:self.shimmerLabel1];
    
//    self.shimmerLabel1.shimmerColor = [UIColor orangeColor];    //高亮颜色
//    self.shimmerLabel1.shimmerType = ST_RightToLeft;    //滚动方向
//    self.shimmerLabel1.durationTime = 2;                //滚动时间
//    self.shimmerLabel1.shimmerWidth = 20;               //高亮的宽度
//    self.shimmerLabel1.shimmerRadius = 20;              //阴影的宽度
    [self.shimmerLabel1 startShimmer];                  //开启闪烁  
}

#pragma mark - lazylaoding
//不同字体颜色的label
-(UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 300, 30)];
        _label.backgroundColor = [UIColor brownColor];
        _label.numberOfLines = 0;
        _label.text = @"我是默认颜色，我是其他颜色，哈哈哈哈！";
    }
    return _label;
}

//闪烁的文字的label
-(WSShiningLabel *)shimmerLabel1 {
    if (!_shimmerLabel1) {
        _shimmerLabel1 = [[WSShiningLabel alloc] initWithFrame:CGRectMake(50, 200, 300, 30)];
        _shimmerLabel1.backgroundColor = [UIColor grayColor];
//        _shimmerLabel1.numberOfLines = 0;
        _shimmerLabel1.text = @"我是会闪烁的文字，哈哈哈哈！";
    }
    return _shimmerLabel1;
}


@end
