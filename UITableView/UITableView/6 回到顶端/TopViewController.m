//
//  TopViewController.m
//  UITableView
//
//  Created by Meng Fan on 16/12/5.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "TopViewController.h"

@interface TopViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *topBtn;

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpViews];
}


- (void)setUpViews {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.topBtn];
}

#pragma mark - lazyLoading
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.rowHeight = 80;
        
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}


-(UIButton *)topBtn {
    if (!_topBtn) {
        _topBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _topBtn.frame = CGRectMake(self.view.frame.size.width-60, self.view.frame.size.height-100, 40, 40);
        [_topBtn setBackgroundImage:[UIImage imageNamed:@"TopBtn"] forState:UIControlStateNormal];
        [_topBtn addTarget:self action:@selector(DoSomething) forControlEvents:UIControlEventTouchUpInside];
        _topBtn.clipsToBounds = YES;
    }
    return _topBtn;
}


#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld行", indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //约定一个显示不显示临界值(偏移量的临界值)
    if (scrollView.contentOffset.y < 450)
    {
        //向上
        self.topBtn.hidden = YES;
        
    } else {
        
        //向下
        self.topBtn.hidden = NO;
        
    }
}

#pragma mark - action
- (void)DoSomething{
    //到顶部
    [_tableView setContentOffset:CGPointMake(0, -64) animated:YES];
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
