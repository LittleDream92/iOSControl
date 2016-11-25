//
//  HeaderStrechViewController.m
//  UITableView
//
//  Created by Meng Fan on 16/11/25.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "HeaderStrechViewController.h"
#import "HFStretchableTableHeaderView.h"

@interface HeaderStrechViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) HFStretchableTableHeaderView *temp;

@property (nonatomic, strong) UIImageView *headerView;
@property (nonatomic, strong) UIImageView *userIconView;

@end

@implementation HeaderStrechViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpViews];
}


#pragma mark - setUpViews
- (void)setUpViews {
    [self.view addSubview:self.tableview];
    
    [self.headerView addSubview:self.userIconView];
    self.userIconView.center = self.headerView.center;
    
    //普通状态下我们设置头视图
    //    self.tableview.tableHeaderView = self.headerView;
    
    //设置 可以拉伸的头视图
    //1、添加进temp View
    [self.temp stretchHeaderForTableView:self.tableview withView:self.headerView andHeadImageView:self.userIconView];
}

#pragma mark - lazyLoading
-(UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableview.delegate = self;
        _tableview.dataSource = self;
        
        _tableview.tableFooterView = [UIView new];
    }
    return _tableview;
}

-(NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
        for (NSInteger i = 0; i < 10; i++) {
            NSString *string = [NSString stringWithFormat:@"I am row %ld", i];
            [_dataArray addObject:string];
        }
    }
    return _dataArray;
}

-(HFStretchableTableHeaderView *)temp {
    if (!_temp) {
        _temp = [[HFStretchableTableHeaderView alloc] init];
    }
    return _temp;
}

-(UIImageView *)headerView {
    if (!_headerView) {
        _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
        _headerView.image = [UIImage imageNamed:@"main_set_background"];
    }
    return _headerView;
}

-(UIImageView *)userIconView {
    if (!_userIconView) {
        _userIconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        
        _userIconView.image = [UIImage imageNamed:@"userHead.jpg"];
        
        _userIconView.layer.cornerRadius = 30;
        _userIconView.layer.masksToBounds = YES;
    }
    return _userIconView;
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
}


//2、实现tableview的滑动代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.temp scrollViewDidScroll:scrollView];
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
