//
//  TableViewViewController.m
//  UITableView
//
//  Created by Meng Fan on 16/11/29.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "TableViewViewController.h"

@interface TableViewViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;

@end

@implementation TableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - lazyLoading
-(UITableView *)leftTableView {
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _leftTableView.delegate = self;
        
        _leftTableView.tableFooterView = [UIView new];
    }
    return _leftTableView;
}

-(UITableView *)rightTableView {
    if (!_rightTableView) {
        _rightTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _rightTableView.tableFooterView = [UIView new];
    }
    return _rightTableView;
}

#pragma mark - UITableViewDataSource


#pragma mark - UITableViewDelegate


@end
