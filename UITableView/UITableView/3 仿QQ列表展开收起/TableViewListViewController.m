//
//  TableViewListViewController.m
//  UITableView
//
//  Created by Meng Fan on 16/11/25.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "TableViewListViewController.h"
#import "MyModel.h"

@interface TableViewListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation TableViewListViewController
/**
 *  类似QQ列表，展开收起
 *
 *  1、处理数据（Model嵌套）；
 *  2、设置组的头视图，添加控件；
 *  3、头视图的控件的触发事件：改变model里的展开收起状态，并刷新表视图；
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpViews];
}


#pragma mark - setUpViews
- (void)setUpViews {
    [self.view addSubview:self.tableview];
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
        
        NSArray *tempData = @[@{@"title":@"我的好友",
                                @"list":@[@{@"title":@"张三"},
                                          @{@"title":@"李四"},
                                          @{@"title":@"王五"}]},
                              @{@"title":@"家人",
                                @"list":@[@{@"title":@"妈妈"},
                                          @{@"title":@"爸爸"},
                                          @{@"title":@"大姨"},
                                          @{@"title":@"大舅"},
                                          @{@"title":@"二姨"},
                                          @{@"title":@"三姨"}]}];
        
        for (NSInteger i = 0; i< [tempData count]; i++) {   //2个2级标题
            
            
            //转化Model   (二级标题Model)
            MyModel *model1 = [[MyModel alloc] init];
            [model1 setValuesForKeysWithDictionary:tempData[i]];
            
            //3级标题的数组
            NSArray *array = tempData[i][@"list"];
            NSMutableArray *data2 = [NSMutableArray array];
            for (NSInteger j = 0; j < [array count]; j++) {
                
                //转化Model   (三级标题Model)
                MyModel *model2 = [[MyModel alloc] init];
                [model2 setValuesForKeysWithDictionary:array[j]];
                
                //最后一级标题的数组
                NSArray *arr = array[j][@"list"];
                NSMutableArray *data1 = [NSMutableArray array];
                for (NSInteger t = 0; t < arr.count; t ++) {
                    
                    //转化Model   (最后一级标题Model)
                    MyModel *model3 = [[MyModel alloc]init];
                    [model3 setValuesForKeysWithDictionary:arr[t]];
                    [data1 addObject:model3];
                }
                
                //手动设置model2
                model2.list = data1;
                [data2 addObject:model2];
            }
            
            //手动设置Model1
            model1.list = data2;
            [_dataArray addObject:model1];
        }
        
    }
    return _dataArray;
}


#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.dataArray count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    MyModel *model = self.dataArray[section];
    if (model.isOpen) {
        return model.list.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    MyModel *model1 = self.dataArray[indexPath.section];
    MyModel *model2 = model1.list[indexPath.row];
    cell.textLabel.text = model2.title;
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//设置组的头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section  {
    MyModel *model = self.dataArray[section];
    NSString *title = model.title;
    
    UIControl *titleView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 35)];
    titleView.tag = 2014+section;
    titleView.backgroundColor = [UIColor whiteColor];
    [titleView addTarget:self action:@selector(sectionAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 0, 25)];
    textLabel.font = [UIFont systemFontOfSize:14];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor = [UIColor grayColor];
    textLabel.text = title;
    [textLabel sizeToFit];
    
//    UILabel *
    
    [titleView addSubview:textLabel];
    
    return titleView;
}

- (void)sectionAction:(UIControl *)control {
    NSInteger section = control.tag - 2014;
    MyModel *model = self.dataArray[section];
    //1.切换点击组的状态
    model.isOpen = !model.isOpen;
    
    //2.刷新tableView
    [self.tableview reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
