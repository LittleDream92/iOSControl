//
//  TextSizeViewController.m
//  UILabel
//
//  Created by Meng Fan on 16/11/17.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "TextSizeViewController.h"

#define Screen_W [UIScreen mainScreen].bounds.size.width
#define Screen_H [UIScreen mainScreen].bounds.size.height

@interface TextSizeViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *labelH;
@property (nonatomic, strong) UILabel *labelW;
@property (nonatomic, strong) UILabel *labelS;

@end

@implementation TextSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"获取label尺寸";
    
    [self example];
    [self example1];
    [self example2];
    [self example3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** size To Fit 自适应 */
- (void)example {
    [self.view addSubview:self.label];
    
    self.label.frame = CGRectMake(0, 100, Screen_W, 0);
    [self.label sizeToFit];
}

/** 获取多行（单行意义不大）label的高度 */
- (void)example1 {
    [self.view addSubview:self.labelH];
    
    CGFloat width = Screen_W-(10*2);
    
    NSDictionary *attr = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:14]};
    CGSize sizeToFit = [self.labelH.text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                        attributes:attr
                                           context:nil].size;
    //此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    self.labelH.frame = CGRectMake(10, 180, width, sizeToFit.height);
}

/** 固定高度，获取label的适应宽度（适合单行文本） */
- (void)example2 {
    [self.view addSubview:self.labelW];
    
    CGFloat height = 50;
    
    NSDictionary *attr = @{NSFontAttributeName:[UIFont fontWithName:@"GillSans-Light" size:16]};
    CGSize sizeToFit = [self.labelW.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                        attributes:attr
                                           context:nil].size;
    //此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    self.labelW.frame = CGRectMake((Screen_W-sizeToFit.width)/2, 300, sizeToFit.width, height);
}


/** 不指定宽高，计算出来，这种情况就算设置为多行，也会按照单行无限宽来计算，一般用来计算单行文本的尺寸 */
- (void)example3 {
    [self.view addSubview:self.labelS];
    
    NSDictionary *attr = @{NSFontAttributeName:[UIFont fontWithName:@"GillSans-Light" size:14]};
    CGSize sizeToFit = [self.labelS.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                                      options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                   attributes:attr
                                                      context:nil].size;
    //此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    self.labelS.frame = CGRectMake((Screen_W-sizeToFit.width)/2, 400, sizeToFit.width, sizeToFit.height);
}


#pragma mark - lazyLoading
-(UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.backgroundColor = [UIColor brownColor];
        
        _label.font = [UIFont systemFontOfSize:15];
        _label.numberOfLines = 0;
        _label.text = @"我是系统字体的15号字在sizeToFit模式下的效果，我是系统字体的15号字在sizeToFit模式下的效果，我是系统字体的15号字在sizeToFit模式下的效果。";
    }
    return _label;
}

-(UILabel *)labelH {
    if (!_labelH) {
        _labelH = [UILabel new];
        _labelH.backgroundColor = [UIColor brownColor];
        
        _labelH.font = [UIFont boldSystemFontOfSize:14];
        _labelH.textColor = [UIColor blueColor];
        _labelH.numberOfLines = 0;
        
        _labelH.text = @"我是粗体14号字在宽度固定高度计算出来的效果，我是粗体14号字在宽度固定高度计算出来的效果，我是粗体14号字在宽度固定高度计算出来的效果。";
    }
    return _labelH;
}

-(UILabel *)labelW {
    if (!_labelW) {
        _labelW = [UILabel new];
        _labelW.backgroundColor = [UIColor cyanColor];
        
        _labelW.numberOfLines = 0;
        _labelW.font = [UIFont fontWithName:@"GillSans-Light" size:16];
        
        _labelW.text = @"我是GillSans-Light16号字体，高度固定，宽度计算出来";
    }
    return _labelW;
}

-(UILabel *)labelS {
    if (!_labelS) {
        _labelS = [UILabel new];
        _labelS.backgroundColor = [UIColor yellowColor];
        _labelS.font = [UIFont fontWithName:@"GillSans-Light" size:14];
        _labelS.numberOfLines = 0;
        _labelS.text = @"我是不固定尺寸计算size的效果一般就算设置多行也无用，因为宽度无限大，so适用于单行文本";
    }
    return _labelS;
}



@end
