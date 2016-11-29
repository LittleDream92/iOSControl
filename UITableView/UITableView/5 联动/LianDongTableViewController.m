//
//  LianDongTableViewController.m
//  UITableView
//
//  Created by Meng Fan on 16/11/29.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "LianDongTableViewController.h"
#import "TableViewViewController.h"
#import "CollectionViewViewController.h"

@interface LianDongTableViewController ()

@end

@implementation LianDongTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"tableView联动";
    }else {
        cell.textLabel.text = @"CollectionView联动";
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        TableViewViewController *vc = [[TableViewViewController alloc] init];
        vc.title = @"tableView联动";
        [self.navigationController showViewController:vc sender:self];
    }else {
        CollectionViewViewController *vc = [[CollectionViewViewController alloc] init];
        vc.title = @"collectionView联动";
        [self.navigationController showViewController:vc sender:self];
    }
}


@end
