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

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;

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

//两端对齐
- (void)example2 {
    [self.view addSubview:self.label1];
    [self.view addSubview:self.label2];
    
    //label2设置两端对齐
    NSMutableAttributedString *changeColorString1 =[[NSMutableAttributedString alloc]initWithString:self.label2.text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentJustified;     // 对齐方式, 设置为两端对齐。
    style.paragraphSpacing = 0;                     // 段落后的间距
    style.paragraphSpacingBefore = 0;               // 段落前的间距
    style.firstLineHeadIndent = 0;                  // 段落第一句缩进
    style.headIndent = 0;                           // 头部缩进(不包括段落第一句)
    
    [changeColorString1 setAttributes:@{NSParagraphStyleAttributeName : style} range:NSMakeRange(0, self.label2.text.length)];
    
    self.label2.attributedText=changeColorString1;
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

-(UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 300, 100)];
        _label1.numberOfLines = 0;
        _label1.backgroundColor = [UIColor cyanColor];
        _label1.text = @"信息时代，每天，我们都会被淹没在大数据的海洋里，不知从什么时候开始，集中注意力也变成一件困难的事了。注意力分散对每一个要想有所专长的人来说，无疑是致命的。尤其对于学生来讲，我们每天都会被大量的信息流所左右，那如何有效的集中自己的注意力，让每一天更有效率呢？今天就给大家分享6个实用的小妙招！";
        [_label1 sizeToFit];
    }
    return _label1;
}

-(UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] initWithFrame:CGRectMake(50, 400, 300, 100)];
        _label2.numberOfLines = 0;
        _label2.backgroundColor = [UIColor cyanColor];
        _label2.text = @"信息时代，每天，我们都会被淹没在大数据的海洋里，不知从什么时候开始，集中注意力也变成一件困难的事了。注意力分散对每一个要想有所专长的人来说，无疑是致命的。尤其对于学生来讲，我们每天都会被大量的信息流所左右，那如何有效的集中自己的注意力，让每一天更有效率呢？今天就给大家分享6个实用的小妙招！";
        [_label2 sizeToFit];
    }
    return _label2;
}


@end
