//
//  ViewController.m
//  UIButton
//
//  Created by Meng Fan on 16/11/10.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "ViewController.h"
#import "CustomButtonViewController.h"
#import "TimerButtonViewController.h"
#import "NumberButtonViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleArray = @[@"调整button内部控件位置", @"button倒计时", @"仿京东购物车加减按钮"];
    
    [self setUpViews];
}

#pragma mark - setUpViews
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
    
    cell.textLabel.text = self.titleArray[indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            CustomButtonViewController *vc = [[CustomButtonViewController alloc] init];
            [self.navigationController showViewController:vc sender:self];
            break;
        }
        case 1:
        {
            TimerButtonViewController *vc = [[TimerButtonViewController alloc] init];
            [self.navigationController showViewController:vc sender:self];
            break;
        }
        case 2:
        {
            NumberButtonViewController *vc = [[NumberButtonViewController alloc] init];
            [self.navigationController showViewController:vc sender:self];
            break;
        }
        case 3:
        {
            break;
        }
        default:
            break;
    }
}

#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
