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

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.titleArray = @[@"Lable 行距和字体", @"获取label字体的宽度或者高度", @"Label 中划线／下划线", @"label多种字体颜色", @"label多种字体大小", @"类目综合"];
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
        default:
            break;
    }
}


@end
