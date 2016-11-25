//
//  SegmentControlViewController.m
//  UIButton
//
//  Created by Meng Fan on 16/11/23.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "SegmentControlViewController.h"
#import "CustomSegmentControlView.h"

@interface SegmentControlViewController () <CustomButtonProtocol>
{
    NSArray *titleArr;
    NSArray *imgArr;
    NSArray *selectImgArr;
}

@end

@implementation SegmentControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self example];
}

/**
    其实这个效果我们在单选按钮的地方就实现过了，效果一样，只不过单选按钮不考虑位置，这里并排放置而已，这里封装的是包含多个button的view控件，运用代理方法拿到选择的button的tag值。
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - example
- (void)example {
    
    titleArr = @[@"left", @"middle", @"right"];
    imgArr = @[@"2.2.png", @"3.png", @"1.2.png"];
    selectImgArr = @[@"2.png", @"3.2.png", @"1.png"];
    
    CustomSegmentControlView *segmentControl = [[CustomSegmentControlView alloc] initWithTitleArray:titleArr imgNameArray:imgArr selectImgNameArray:selectImgArr buttonW:70];
    segmentControl.frame = CGRectMake((self.view.bounds.size.width-210)/2, 100, 210, 40);
    segmentControl.myDelegate = self;
    
    segmentControl.textColor = [UIColor blueColor];
    segmentControl.selectTextColor = [UIColor whiteColor];
    segmentControl.font = [UIFont systemFontOfSize:13]; 
    [self.view addSubview:segmentControl];
}

#pragma mark - CustomButtonProtocol
-(void)getTag:(NSInteger)tag {
    NSLog(@"tag : %ld", tag);
}



@end
