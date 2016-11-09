//
//  LabelFontViewController.m
//  UILabel
//
//  Created by Meng Fan on 16/11/9.
//  Copyright © 2016年 imac. All rights reserved.
//

//设置label的行距和字体
#import "LabelFontViewController.h"

@interface LabelFontViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation LabelFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"行距和字体颜色";
    [self.view addSubview:self.label];
    
    [self setUpTextFontAndDistance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpTextFontAndDistance {
    NSString *textString = @"信息时代，每天，我们都会被淹没在大数据的海洋里，不知从什么时候开始，集中注意力也变成一件困难的事了。注意力分散对每一个要想有所专长的人来说，无疑是致命的。尤其对于学生来讲，我们每天都会被大量的信息流所左右，那如何有效的集中自己的注意力，让每一天更有效率呢？今天就给大家分享6个实用的小妙招！";
    NSMutableAttributedString *attStr1 = [[NSMutableAttributedString alloc] initWithString:textString];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    [paraStyle setLineSpacing:20];
    [attStr1 addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, [textString length])];
    [attStr1 addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, [textString length])];
    [self.label setAttributedText:attStr1];
    [self.label sizeToFit];
}

#pragma mark - lazyloading
-(UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width-100, 200)];
        _label.backgroundColor = [UIColor cyanColor];
        
        _label.numberOfLines = 0;
    }
    return _label;
}

@end
