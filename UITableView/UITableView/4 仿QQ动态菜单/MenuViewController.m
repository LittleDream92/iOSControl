//
//  MenuViewController.m
//  UITableView
//
//  Created by Meng Fan on 16/11/28.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuView.h"
#import "SecondViewController.h"

@interface MenuViewController ()

@property (nonatomic, strong) UIButton *operationbutton;


@end

//Menu视图的背景图片是灰色带箭头的
@implementation MenuViewController
{
    NSArray *_dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpdata];
    [self setUpNav];
    
    [self setUpViews];
}


- (void)setUpdata {
    
    NSDictionary *dict1 = @{@"imageName" : @"icon_button_affirm",
                            @"itemName" : @"撤回"};
    NSDictionary *dict2 = @{@"imageName" : @"icon_button_recall",
                            @"itemName" : @"确认"};
    NSDictionary *dict3 = @{@"imageName" : @"icon_button_record",
                            @"itemName" : @"记录"};
    NSArray *dataArray = @[dict1, dict2, dict3];
    _dataArray = dataArray;
}


- (void)setUpNav {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.operationbutton];
}


- (void)setUpViews {
    __weak __typeof(&*self)weakSelf = self;
    
    /** 创建Menu视图：frame传递nil，则取默认值，参数target必填 */
    [MenuView createMenuWithFrame:CGRectZero
                           target:self.navigationController
                        dataArray:_dataArray
                  itemsClickBlock:^(NSString *str, NSInteger tag) {
                      
                      [weakSelf doSomething:str tag:tag];
                      
                  } backViewTap:^{
                      //点击背景遮罩视图后的block，可自定义事件
                      //让rightButton点击，可再次pop出menu
                      [MenuView hidden];
                      self.operationbutton.selected = NO;
                  }];
}


#pragma mark - lazyloading
-(UIButton *)operationbutton {
    if (!_operationbutton) {
        
        _operationbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        _operationbutton.frame = CGRectMake(0, 0, 100, 40);
        [_operationbutton setTitle:@"operation" forState:UIControlStateNormal];
        [_operationbutton setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        [_operationbutton addTarget:self action:@selector(operationAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _operationbutton;
}

#pragma mark - action
- (void)operationAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    NSLog(@"%d", sender.selected);
    
    [MenuView showMenuWithAnimation:sender.selected];
}


//回调事件
- (void)doSomething:(NSString *)str tag:(NSInteger)tag {
    
    //隐藏menuView
    [MenuView hidden];
    self.operationbutton.selected = NO;
    
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.title = [NSString stringWithFormat:@"%@_%ld", str, tag];
    vc.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    [self.navigationController showViewController:vc sender:self];
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
