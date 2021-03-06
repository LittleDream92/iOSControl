//
//  ViewController.m
//  UIButton
//
//  Created by Meng Fan on 16/11/23.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "ViewController.h"
#import "SingleChooseViewController.h"
#import "TimerButtonViewController.h"
#import "SegmentControlViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@"单选按钮", @"倒计时", @"自定义SegmentControl"];
    
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            SingleChooseViewController *vc = [[SingleChooseViewController alloc] init];
            vc.title = self.dataArray[0];
            [self.navigationController showViewController:vc sender:self];
            break;
        }
        case 1:
        {
            TimerButtonViewController *vc = [[TimerButtonViewController alloc] init];
            vc.title = self.dataArray[1];
            [self.navigationController showViewController:vc sender:self];
            break;
        }
        case 2:
        {
            SegmentControlViewController *vc = [[SegmentControlViewController alloc] init];
            vc.title = self.dataArray[2];
            [self.navigationController showViewController:vc sender:self];
            break;
        }
        default:
            break;
    }
}


@end
