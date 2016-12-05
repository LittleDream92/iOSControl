//
//  ViewController.m
//  SDCycleScrollDemo
//
//  Created by Meng Fan on 16/12/5.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "ViewController.h"
#import "SDCycleScrollView.h"

@interface ViewController () <SDCycleScrollViewDelegate>
{
    NSArray *imagesURLString;
    NSArray *titleArr;
}
@property (nonatomic, strong) SDCycleScrollView *imagesView;
@property (nonatomic, strong) SDCycleScrollView *imageAndTitleView;

@end

/**
 *  SDCycleScrollView   iOS 图片文字无限轮播器
 *  支持pod导入
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpData];
    
    [self example1];
    [self example2];
}



#pragma mark - example
/**
 *  加载网络图片，有默认图片
 */
- (void)example1 {
    [self.view addSubview:self.imagesView];
}


- (void)example2 {
    [self.view addSubview:self.imageAndTitleView];
}


#pragma mark - lazyLoading

/**
 *  加载网络图片，有默认图片
 */
-(SDCycleScrollView *)imagesView {
    if (!_imagesView) {
        // 网络加载 --- 创建不带标题的图片轮播器
        _imagesView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 180) imageURLStringsGroup:nil];
        
        _imagesView.infiniteLoop = YES;
        _imagesView.delegate = self;
        _imagesView.placeholderImage=[UIImage imageNamed:@"homepagebannerplaceholder"];
        _imagesView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        _imagesView.autoScrollTimeInterval = 2.0; // 轮播时间间隔，默认1.0秒，可自定义
        
        //模拟加载延迟
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _imagesView.imageURLStringsGroup = imagesURLString;
        });
    }
    return _imagesView;
}

-(SDCycleScrollView *)imageAndTitleView {
    if (!_imageAndTitleView) {
        _imageAndTitleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 180) imageURLStringsGroup:nil];
        _imageAndTitleView.backgroundColor = [UIColor cyanColor];
        
        _imageAndTitleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _imageAndTitleView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        
        //模拟加载延迟
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _imageAndTitleView.imageURLStringsGroup = imagesURLString;
            _imageAndTitleView.titlesGroup = titleArr;
        });
    }
    return _imageAndTitleView;
}

#pragma mark - SDCycleScrollViewDelegate
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"---点击了第%ld张图片", index);
}

- (void)indexOnPageControl:(NSInteger)index {
    
}

#pragma mark - data
- (void)setUpData {
    //假数据 URL
    imagesURLString = @[
                        @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t1402/221/421883372/88115/8cc2231a/55815835N35a44559.jpg",
                        @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t976/208/1221678737/91179/5d7143d5/5588e849Na2c20c1a.jpg",
                        @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t805/241/1199341035/289354/8648fe55/5581211eN7a2ebb8a.jpg",
                        @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t1606/199/444346922/48930/355f9ef/55841cd0N92d9fa7c.jpg",
                        @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t1609/58/409100493/49144/7055bec5/557e76bfNc065aeaf.jpg",
                        @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t895/234/1192509025/111466/512174ab/557fed56N3e023b70.jpg",
                        @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t835/313/1196724882/359493/b53c7b70/5581392cNa08ff0a9.jpg",
                        @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t898/15/1262262696/95281/57d1f12f/558baeb4Nbfd44d3a.jpg"
                        ];
    
    //title arr
    titleArr = @[@"标题一",
                 @"标题二",
                 @"标题三",
                 @"标题四",
                 @"标题五",
                 @"标题六",
                 @"标题七",
                 @"标题八"];
}



#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
