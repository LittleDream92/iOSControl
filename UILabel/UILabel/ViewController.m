//
//  ViewController.m
//  UILabel
//
//  Created by imac on 15/9/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "ViewController.h"

#import "LabelFontViewController.h"
#import "TextSizeViewController.h"
#import "LabelLineViewController.h"
#import "TextColorsViewController.h"
#import "TextFontViewController.h"
#import "TotalViewController.h"
#import "TagViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation ViewController

#pragma mark - UILabel 简介
//本函数仅仅是UI Label的基础介绍，不做调用
- (void)example {
    
    //创建label
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 280, 80)];
    
    //设置背景色
    label1.backgroundColor = [UIColor grayColor];
    
    //设置tag
    label1.tag = 91;
    
    //设置标签文本
    label1.text = @"Hello world!";
    //设置标签文本字体和字体大小
    label1.font = [UIFont fontWithName:@"Arial" size:30];
    //设置文本对其方式
    label1.textAlignment = NSTextAlignmentCenter;
    //文本对齐方式有以下三种
    //typedef enum {
    //    NSTextAlignmentLeft = 0,左对齐
    //    UITextAlignmentCenter,居中对齐
    //    UITextAlignmentRight, 右对齐
    //} UITextAlignment;
    
    //文本颜色
    label1.textColor = [UIColor blueColor];
    //超出label边界文字的截取方式
    label1.lineBreakMode = NSLineBreakByTruncatingTail;
    //截取方式有以下6种
//    // NSParagraphStyle
//    typedef NS_ENUM(NSInteger, NSLineBreakMode) {
//        NSLineBreakByWordWrapping = 0,     	// Wrap at word boundaries, default 以空格为边界，保留整个单词
//        NSLineBreakByCharWrapping,		// Wrap at character boundaries 保留整个字符
//        NSLineBreakByClipping,		// Simply clip  到边界为止
//        NSLineBreakByTruncatingHead,	// Truncate at head of line: "...wxyz"
//        NSLineBreakByTruncatingTail,	// Truncate at tail of line: "abcd..."
//        NSLineBreakByTruncatingMiddle	// Truncate middle of line:  "ab...yz"
//    } NS_ENUM_AVAILABLE(10_0, 6_0);

    //文本文字自适应大小
    label1.adjustsFontSizeToFitWidth = YES;
    //当adjustsFontSizeToFitWidth=YES时候，如果文本font要缩小时
    //baselineAdjustment这个值控制文本的基线位置，只有文本行数为1是有效
    label1.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    //有三种方式
    //typedef enum {
    //    UIBaselineAdjustmentAlignBaselines = 0, 默认值文本最上端于label中线对齐
    //    UIBaselineAdjustmentAlignCenters,//文本中线于label中线对齐
    //    UIBaselineAdjustmentNone,//文本最低端与label中线对齐
    //} UIBaselineAdjustment;
    
    //文本最多行数，为0时没有最大行数限制
    label1.numberOfLines = 2;
    //文本高亮
    label1.highlighted = YES;
    //文本是否可变
    label1.enabled = YES;
    
    //文本阴影颜色
    label1.shadowColor = [UIColor grayColor];
    //阴影大小
    label1.shadowOffset = CGSizeMake(1.0, 1.0);
    
    //是否能与用户交互
    label1.userInteractionEnabled = YES;
    
    [self.view addSubview:label1];
}


#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.titleArray = @[@"Lable 行距和字体", @"获取label字体的宽度或者高度", @"Label 中划线／下划线", @"label多种字体颜色及闪烁", @"label多种字体大小", @"总结——类目综合", @"选择标签"];
    [self setUpViews];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpViews {
    [self.view addSubview:self.tableView];
}

#pragma mark - lazyloading
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = self.titleArray[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            LabelFontViewController *vc = [[LabelFontViewController alloc] init];
            [self.navigationController showViewController:vc sender:self];
            break;
        }
        case 1:
        {
            TextSizeViewController *vc = [[TextSizeViewController alloc] init];
            [self.navigationController showViewController:vc sender:self];
            break;
        }
        case 2:
        {
            LabelLineViewController *vc = [[LabelLineViewController alloc] init];
            [self.navigationController showViewController:vc sender:self];
            break;
        }
        case 3:
        {
            TextColorsViewController *vc = [[TextColorsViewController alloc] init];
            [self.navigationController showViewController:vc sender:self];
            break;
        }
        case 4:
        {
            TextFontViewController *vc = [[TextFontViewController alloc] init];
            [self.navigationController showViewController:vc sender:self];
            break;
        }
        case 5:
        {
            TotalViewController *vc = [[TotalViewController alloc] init];
            [self.navigationController showViewController:vc sender:self];
            break;
        }
        case 6:
        {
            TagViewController *vc = [[TagViewController alloc] init];
            [self.navigationController showViewController:vc sender:self];
            break;
        }
        default:
            break;
    }
}


@end
