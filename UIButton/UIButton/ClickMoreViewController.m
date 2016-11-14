//
//  ClickMoreViewController.m
//  UIButton
//
//  Created by Meng Fan on 16/11/14.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "ClickMoreViewController.h"

@interface ClickMoreViewController ()
{
    UIButton *moreBtn;
    BOOL isOpen;
    NSArray *array;
    UIScrollView *contentView1;
}

@end

@implementation ClickMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"折叠展开";
    
    //初始化
    isOpen = NO;
    array = @[@"小米回家1",@"小米2",@"小米回家吃饭3",@"小米4",@"小米回5",@"小米回家淡淡的6",@"小米家7",@"小米回家8",@"小米家9",@"小米0",@"小米回家a"];
    
    [self setUpViews];
}


#pragma mark - setUpViews
- (void)setUpViews {
    contentView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, 320, 50)];
    contentView1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:contentView1];
    
    UIView *testView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    testView.backgroundColor = [UIColor redColor];
    [contentView1 addSubview:testView];
    
//    if (array.count > 5) {
//        NSArray *newArray = [[array subarrayWithRange:NSMakeRange(0, 5)] copy];
//        
//        for (int i = 0; i < newArray.count; i++) {
//            NSString *titleStr = newArray[i];
////            NSLog(@"%@", titleStr);
//            
////            static UIButton *newRecordBtn = nil;
//            UIButton *newBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//            newBtn.tag = 100 + i;
//            
//            CGRect newRect = [titleStr boundingRectWithSize:CGSizeMake(320-20, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:newBtn.titleLabel.font} context:nil];
//            NSLog(@"%f_%f_%f_%f", newRect.origin.x, newRect.origin.y, newRect.size.width, newRect.size.height);
//            
////            if (i == 0) {
////                newBtn.frame = CGRectMake(10, 10, newRect.size.width, newRect.size.height);
////            }
//            
//            newBtn.frame = CGRectMake(10, 10, 80, 30);
//            newBtn.backgroundColor = [UIColor yellowColor];
//            [newBtn addTarget:self action:@selector(newBtnAction:) forControlEvents:UIControlEventTouchUpInside];
//            [contentView1 addSubview:newBtn];
//        }
//        // Local declaration of 'newArray' hides instance variable //变量重名
//    }else {
//        
//    }
    
//    [self.view addSubview:contentView1];
}

#pragma mark - lazyloading


#pragma mark - action
- (void)newBtnAction:(UIButton *)sender {
    NSLog(@"button:%ld", sender.tag);
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
