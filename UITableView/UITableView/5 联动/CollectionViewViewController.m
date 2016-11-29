//
//  CollectionViewViewController.m
//  UITableView
//
//  Created by Meng Fan on 16/11/29.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "CollectionViewViewController.h"
#import "CollectionCategoryModel.h"
#import "NSObject+Property.h"
#import "LeftTableViewCell.h"
#import "LJCollectionViewFlowLayout.h"
#import "CollectionViewCell.h"
#import "CollectionViewHeaderView.h"

@interface CollectionViewViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
{
    NSInteger _selectIndex;
    BOOL _isScrollDown;
}

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UICollectionView *rightCollectionView;

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *collectionDatas;

@end

@implementation CollectionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpData];
    [self setUpViews];
}



#pragma mark - setUp
//处理本地json数据
- (void)setUpData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"liwushuo" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *categories = dict[@"data"][@"categories"];
    for (NSDictionary *dict in categories)
    {
        CollectionCategoryModel *model =
        [CollectionCategoryModel objectWithDictionary:dict];
        [self.dataSource addObject:model];
        
        NSMutableArray *datas = [NSMutableArray array];
        for (SubCategoryModel *sModel in model.subcategories)
        {
            [datas addObject:sModel];
        }
        [self.collectionDatas addObject:datas];
    }
}

- (void)setUpViews {
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightCollectionView];
    
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


-(UICollectionView *)rightCollectionView {
    if (!_rightCollectionView) {
        LJCollectionViewFlowLayout *flowlayout = [[LJCollectionViewFlowLayout alloc] init];
        //设置滚动方向
        [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        //左右间距
        flowlayout.minimumInteritemSpacing = 2;
        //上下间距
        flowlayout.minimumLineSpacing = 2;
        _rightCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(2 + 80, 2 + 64, self.view.bounds.size.width - 80 - 4, self.view.bounds.size.height - 64 - 4) collectionViewLayout:flowlayout];
        _rightCollectionView.delegate = self;
        _rightCollectionView.dataSource = self;
        _rightCollectionView.showsVerticalScrollIndicator = NO;
        _rightCollectionView.showsHorizontalScrollIndicator = NO;
        [_rightCollectionView setBackgroundColor:[UIColor clearColor]];
        //注册cell
        [_rightCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier_CollectionView];
        //注册分区头标题
        [_rightCollectionView registerClass:[CollectionViewHeaderView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"CollectionViewHeaderView"];
    }
    return _rightCollectionView;
}


- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (NSMutableArray *)collectionDatas {
    if (!_collectionDatas) {
        _collectionDatas = [NSMutableArray array];
    }
    return _collectionDatas;
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_Left forIndexPath:indexPath];
    CollectionCategoryModel *model = self.dataSource[indexPath.row];
    cell.name.text = model.name;
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectIndex = indexPath.row;
    [self.rightCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:_selectIndex] atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
    [self.leftTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_selectIndex inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    CollectionCategoryModel *model = self.dataSource[section];
    return model.subcategories.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier_CollectionView forIndexPath:indexPath];
    SubCategoryModel *model = self.collectionDatas[indexPath.section][indexPath.row];
    cell.model = model;
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.view.bounds.size.width - 80 - 4 - 4) / 3,
                      (self.view.bounds.size.width - 80 - 4 - 4) / 3 + 30);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) { // header
        reuseIdentifier = @"CollectionViewHeaderView";
    }
    CollectionViewHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                        withReuseIdentifier:reuseIdentifier
                                                                               forIndexPath:indexPath];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CollectionCategoryModel *model = self.dataSource[indexPath.section];
        view.title.text = model.name;
    }
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.bounds.size.width, 30);
}

// CollectionView分区标题即将展示
- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    // 当前CollectionView滚动的方向向上，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）
    if (!_isScrollDown && collectionView.dragging)
    {
        [self selectRowAtIndexPath:indexPath.section];
    }
}

// CollectionView分区标题展示结束
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(nonnull UICollectionReusableView *)view forElementOfKind:(nonnull NSString *)elementKind atIndexPath:(nonnull NSIndexPath *)indexPath {
    // 当前CollectionView滚动的方向向下，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）
    if (_isScrollDown && collectionView.dragging) {
        [self selectRowAtIndexPath:indexPath.section + 1];
    }
}

// 当拖动CollectionView的时候，处理TableView
- (void)selectRowAtIndexPath:(NSInteger)index {
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

#pragma mark - UIScrollView Delegate
// 标记一下CollectionView的滚动方向，是向上还是向下
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    static float lastOffsetY = 0;
    
    if (self.rightCollectionView == scrollView) {
        _isScrollDown = lastOffsetY < scrollView.contentOffset.y;
        lastOffsetY = scrollView.contentOffset.y;
    }
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
