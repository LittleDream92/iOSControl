//
//  TotalViewController.m
//  UILabel
//
//  Created by Meng Fan on 16/11/9.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "TotalViewController.h"
#import "UILabel+LabelExtension.h"

@interface TotalViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation TotalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"类目实现";
    
    [self setUpViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setUpViews
- (void)setUpViews {
    [self.view addSubview:self.label];
    
    //设置别的颜色
    [self.label changeColorWithColor:[UIColor orangeColor] colorText:@"有一个事实大家肯定都注意到了，"];
    [self.label changeColorWithColor:[UIColor redColor] colorText:@"有说要结合阅读材料学习记忆的，"];
    [self.label changeColorWithColor:[UIColor blueColor] colorText:@"但我还是想一直保持学英语的节奏啊，"];
    
    //设置别的字体
    [self.label changeFontWithFont:[UIFont boldSystemFontOfSize:18] fontText:@"有一个事实大家肯定都注意到"];
    [self.label changeFontWithFont:[UIFont systemFontOfSize:11] fontText:@"比如考完4级那么就"];
    
    //设置中划线
    [self.label setThroughLineWithText:@"就是现在学习英语"];
    //设置带样式的中划线
    [self.label setThroughLineWithText:@"有说要结合阅读材料学习记忆" color:[UIColor blackColor]];
    
    //设置下划线
    [self.label setUnderLineWithText:@"有说要结合阅读材料学习记忆"];
    [self.label setUnderLineWithText:@"比如考完4级那么就" color:[UIColor redColor]];
    
    //设置行距
    [self.label changeLabelSpaceWithSpace:15 text:self.label.text];
    
    //给label添加边框
    self.label.layer.borderColor = [UIColor cyanColor].CGColor;
    self.label.layer.borderWidth = 2;
    
    [self.label sizeToFit];
}

#pragma mark - lazyloading
-(UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 75, self.view.bounds.size.width-40, 200)];
        
//        _label.backgroundColor = [UIColor cyanColor];
        
        //两端对齐
        _label.textAlignment = NSTextAlignmentJustified;
        
        _label.numberOfLines = 0;
        _label.text = @"有一个事实大家肯定都注意到了，就是现在学习英语的方法太多了。就单单从背单词来说吧，有单纯从单词本身出发记忆的，有说要结合阅读材料学习记忆的，就说从单词本身记忆的吧，还分为词根记忆法、联想记忆法及死记硬背法等等。单单就背个单词方法就特别多，更别说其它的了。      \n  就拿我自己举例好了，我每次学英语的迷茫期是在某个备考阶段结束的时候。比如考完4级那么就奔着6级去呗，但考完6级，我这个非英语专业学生又考不了8级，但我还是想一直保持学英语的节奏啊，那我到底要学些什么、怎么学？  \n 然后我就开始像无头苍蝇一样乱撞了。听说看英文原著不仅有利于单词学习还是特别好的英语输入方式，然后我就开始看，结果一本还没看完，我又转去看迪斯尼动画片了，因为他们说动画片比美剧更适合学习，还没认认真真完全看好一部电影，我就又遇到了新的方法就又去尝试了。";
        [_label sizeToFit];
    }
    return _label;
}



@end
