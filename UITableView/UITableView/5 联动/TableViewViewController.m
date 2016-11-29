//
//  TableViewViewController.m
//  UITableView
//
//  Created by Meng Fan on 16/11/29.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "TableViewViewController.h"
#import "NSObject+Property.h"
#import "CategoryModel.h"

#import "LeftTableViewCell.h"

@interface TableViewViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;

//左边数据
@property (nonatomic, strong) NSMutableArray *categoryData;
//右边数据
@property (nonatomic, strong) NSMutableArray *foodData;

@end

@implementation TableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpData];
    [self setUpViews];
}

#pragma mark - setUp
//处理本地json数据
- (void)setUpData {
    //获取路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"meituan" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *foods = dict[@"data"][@"food_spu_tags"];
    
    //转化Model
    for (NSDictionary *dict in foods) {
        CategoryModel *model = [CategoryModel objectWithDictionary:dict];
        [self.categoryData addObject:model];
        
        NSMutableArray *datas = [NSMutableArray array];
        for (FoodModel *f_model in model.spus) {
            [datas addObject:f_model];
        }
        [self.foodData addObject:datas];
    }
}

- (void)setUpViews {
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightTableView];
    
    //默认
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
}


#pragma mark - lazyLoading
-(UITableView *)leftTableView {
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 80, self.view.bounds.size.height) style:UITableViewStylePlain];
        
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        
        _leftTableView.rowHeight = 55;
        _leftTableView.showsVerticalScrollIndicator = NO;
        _leftTableView.separatorColor = [UIColor clearColor];
        _leftTableView.tableFooterView = [UIView new];
        
        //注册单元格
        [_leftTableView registerClass:[LeftTableViewCell class] forCellReuseIdentifier:kCellIdentifier_Left];
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

//左边数据
- (NSMutableArray *)categoryData {
    if (!_categoryData) {
        _categoryData = [NSMutableArray array];
    }
    return _categoryData;
}

//右边数据
- (NSMutableArray *)foodData {
    if (!_foodData) {
        _foodData = [NSMutableArray array];
    }
    return _foodData;
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categoryData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_Left forIndexPath:indexPath];
    FoodModel *model = self.categoryData[indexPath.row];
    cell.name.text = model.name;
    return cell;
}

#pragma mark - UITableViewDelegate


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
