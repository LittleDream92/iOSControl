//
//  ViewController.m
//  UITableView
//
//  Created by Meng Fan on 16/11/25.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "ViewController.h"

#import "SwipCellViewController.h"
#import "HeaderStrechViewController.h"
#import "TableViewListViewController.h"
#import "MenuViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpViews];
}

#pragma mark - setUpViews
- (void)setUpViews {
    [self.view addSubview:self.tableView];
}

#pragma mark - lazyLoading
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

-(NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
        NSArray *arr = @[@"仿微信cell左滑菜单按钮", @"个人中心头像拉伸动画", @"仿QQ列表展开收起", @"仿QQ的动态菜单"];
        [_dataArray addObjectsFromArray:arr];
    }
    return _dataArray;
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            SwipCellViewController *vc = [[SwipCellViewController alloc] init];
            vc.title = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:
        {
            HeaderStrechViewController *vc = [[HeaderStrechViewController alloc] init];
            vc.title = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:
        {
            TableViewListViewController *vc = [[TableViewListViewController alloc] init];
            vc.title = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:
        {
            MenuViewController *vc = [[MenuViewController alloc] init];
            vc.title = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
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
