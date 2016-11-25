//
//  SwipCellViewController.m
//  UITableView
//
//  Created by Meng Fan on 16/11/25.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "SwipCellViewController.h"

#define WeakSelf __weak typeof(self) weakSelf = self;


@interface SwipCellViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation SwipCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpViews];
}

#pragma mark - setUpViews
- (void)setUpViews {
    [self.view addSubview:self.label];
    [self.view addSubview:self.tableView];
}


#pragma mark - lazyLoading
-(UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 140)];
        _label.numberOfLines = 0;
        _label.text = @"-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath 方法返回的是一个数组，可以设置一个或者多个UITableViewRowAction，可以定义背景颜色和title，能够满足基本的按钮设置。";
    }
    return _label;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.label.frame), self.view.bounds.size.width, self.view.bounds.size.height-CGRectGetMaxY(self.label.frame)) style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;

        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
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

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    cell.backgroundColor = [UIColor colorWithRed:(arc4random()%255/255.0) green:(arc4random()%255/255.0) blue:(arc4random()%255/255.0) alpha:1];
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



#pragma mark -
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
     typedef NS_ENUM(NSInteger, UITableViewRowActionStyle) {
     UITableViewRowActionStyleDefault = 0,
     UITableViewRowActionStyleDestructive = UITableViewRowActionStyleDefault,   //红色背景图片
     UITableViewRowActionStyleNormal        //灰色背景颜色
     } NS_ENUM_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED;
     */
    
    WeakSelf
    UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {//title可自已定义
        NSLog(@"点击删除后的操作");
        //删除数组中数据
        [weakSelf.dataArray removeObjectAtIndex:indexPath.row];
        //删除单元格
        [weakSelf.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
    }];//此处是iOS8.0以后苹果最新推出的api，UITableViewRowAction，Style是划出的标签颜色等状态的定义，这里也可自行定义
    UITableViewRowAction *editRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"取消关注" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"点击取消关注之后的操作");
    }];
    editRowAction.backgroundColor = [UIColor colorWithRed:0 green:124/255.0 blue:223/255.0 alpha:1];//可以定义RowAction的颜色
    return @[deleteRoWAction, editRowAction];//最后返回这俩个RowAction 的数组
}

#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
