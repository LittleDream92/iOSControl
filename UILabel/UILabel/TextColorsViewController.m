//
//  TextColorsViewController.m
//  UILabel
//
//  Created by Meng Fan on 16/11/9.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "TextColorsViewController.h"

@interface TextColorsViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation TextColorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"字体多种颜色";
    
    [self setUpViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpViews {
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

#pragma mark - lazylaoding
-(UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 300, 30)];
        _label.backgroundColor = [UIColor brownColor];
        _label.numberOfLines = 0;
        _label.text = @"我是默认颜色，我是其他颜色，哈哈哈哈！";
    }
    return _label;
}

@end
