//
//  TextFontViewController.m
//  UILabel
//
//  Created by Meng Fan on 16/11/9.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "TextFontViewController.h"
#import "UILabel+NSMutableAttributedString.h"

@interface TextFontViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *verticalLabel;

@end

@implementation TextFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"字体多种字号／类型";
    
    [self example1];
    [self example2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//同一label，不同字体
- (void)example1 {
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

//竖排label
- (void)example2 {
    [self.view addSubview:self.verticalLabel];
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


-(UILabel *)verticalLabel {
    if (!_verticalLabel) {
        _verticalLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 200, 300)];
        _verticalLabel.backgroundColor = [UIColor cyanColor];
        _verticalLabel.numberOfLines = 0;
        _verticalLabel.text = @"我\n是\n竖\n排\n显\n示\n的\nlabel\n，\n哈\n哈\n哈\n哈\n！";
        [_verticalLabel sizeToFit];
    }
    return _verticalLabel;
}

@end
