//
//  TextFontViewController.m
//  UILabel
//
//  Created by Meng Fan on 16/11/9.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "TextFontViewController.h"

@interface TextFontViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation TextFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"字体多种字号／类型";
    
    [self setUpViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setUpViews {
    [self.view addSubview:self.label];
    
    //设置颜色
    NSString *colorText2 = @"我是其他字型";
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithString:self.label.text];
    NSRange colorRange2 = NSMakeRange([[textString string] rangeOfString:colorText2].location, [[textString string] rangeOfString:colorText2].length);
    [textString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:colorRange2];
    
    NSString *colorText = @"哈哈哈哈！";
    NSRange colorRange = NSMakeRange([[textString string] rangeOfString:colorText].location, [[textString string] rangeOfString:colorText].length);
    [textString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:colorRange];
    
    self.label.attributedText = textString;
    [self.label sizeToFit];
}


#pragma mark - lazylaoding
-(UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 300, 30)];
        _label.backgroundColor = [UIColor brownColor];
        _label.numberOfLines = 0;
        _label.text = @"我是默认字型，我是其他字型，哈哈哈哈！";
    }
    return _label;
}


@end
