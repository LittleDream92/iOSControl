//
//  RichLabelViewController.m
//  UILabel
//
//  Created by Meng Fan on 16/11/22.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "RichLabelViewController.h"

#import "NSMutableAttributedString+Extention.h"
#import "NSString+FindFace.h"

@interface RichLabelViewController ()

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;

@property (nonatomic, strong) UILabel *label3;

@end

@implementation RichLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"图文混排";
    
    [self setUpViews];
    [self OtherRichLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setUpViews
- (void)setUpViews {
    
    /*  富文本实现图文混排
        其实所谓的富文本我们在前边设置不同颜色，不同字体的时候已经接触到了，就是丰富多彩的文本，除此之外，本控制器来学习富文本的图文混排
    */
    
    [self.view addSubview:self.label1];
    [self.label1 sizeToFit];
    
    [self.view addSubview:self.label2];
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:self.label2.text];
    //添加表情
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    //表情图片
    attch.image = [UIImage imageNamed:@"smile.png"];
    //设置图片大小
    attch.bounds = CGRectMake(0, 0, 32, 32);
    //创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    [attri appendAttributedString:string];
    
    // 用label的attributedText属性来使用富文本
    self.label2.attributedText = attri;
    [self.label2 sizeToFit];
}


- (void)OtherRichLabel {
    [self.view addSubview:self.label3];
    
    NSString *coreTextString = @"CoreText[/爱心]框架是基于 iOS 3.2+ 和 OSX 10.5+ [/握手]的一种能够对文本格式和文本布局进行精细控制的文本引擎。它良好的结合了 UIKit 和 Core Graphics/Quartz：UIKit 的 UILabel允许你通过在 IB 中简单的拖曳添加文本，[/大兵]但你不能改变文本的颜色和其中的单词。[/强]";
    self.label3.attributedText = [NSMutableAttributedString stringWithText:coreTextString];
    
}


#pragma mark -lazyLoading
-(UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 100)];
        _label1.text = @"我是图文混排的文字，原有的图片，😄";
    }
    return _label1;
}

-(UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 300, 100)];
        _label2.text = @"我是图文混排的文字，哈哈！自定义的图片";
    }
    return _label2;
}

-(UILabel *)label3 {
    if (!_label3) {
        _label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 300, 150)];
        _label3.backgroundColor = [UIColor cyanColor];
        _label3.numberOfLines = 0;
    }
    return _label3;
}


@end
