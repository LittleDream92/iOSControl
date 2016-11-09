//
//  LabelLineViewController.m
//  UILabel
//
//  Created by Meng Fan on 16/11/9.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "LabelLineViewController.h"

@interface LabelLineViewController ()

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;

@end

@implementation LabelLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"中划线／下划线";
    
    [self setUpViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpViews {
    [self.view addSubview:self.label1];
    [self.view addSubview:self.label2];
    
    
    NSDictionary *dic1 = @{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],
                          NSFontAttributeName:[UIFont systemFontOfSize:16],
                          NSForegroundColorAttributeName:[UIColor blueColor]};
    NSString *str = [NSString stringWithFormat:@"我是测试中划线的数据"];
    NSMutableAttributedString *oldPriceAtt = [[NSMutableAttributedString alloc] initWithString:str attributes:dic1];
    [self.label1 setAttributedText:oldPriceAtt];
    
    
    NSDictionary *dic2 = @{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:@"我是测试下划线的数据" attributes:dic2];
    [self.label2 setAttributedText:attribtStr];
}

#pragma mark - lazyloading
-(UILabel *)label1 {
    if (!_label1) {
        _label1  = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 300, 30)];
        _label1.backgroundColor = [UIColor cyanColor];
    }
    return _label1;
}

-(UILabel *)label2 {
    if (!_label2) {
        _label2  = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 300, 30)];
        _label2.backgroundColor = [UIColor brownColor];
    }
    return _label2;
}


@end
