//
//  TimerButtonViewController.m
//  UIButton
//
//  Created by Meng Fan on 16/11/10.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "TimerButtonViewController.h"

@interface TimerButtonViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation TimerButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"button倒计时";
    
    [self setUpViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setUpViews
- (void)setUpViews {
    
    [self.view addSubview:self.button];
}

#pragma mark - lazyloading
-(UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _button.frame = CGRectMake(100, 200, 200, 40);
        _button.backgroundColor = [UIColor brownColor];
        [_button setTitle:@"点我倒计时" forState:UIControlStateNormal];
        
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _button;
}

#pragma mark - action
- (void)buttonAction:(UIButton *)sender {
    NSLog(@"开始倒计时");
    
    __block int timeout = 30; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeout<=0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求
                [sender setTitle:@"发送验证码" forState:UIControlStateNormal];
                sender.userInteractionEnabled = YES;
                
            });
            
        }else{
//            int minutes = timeout / 60;
            
            int seconds = timeout % 60;
            
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                
                NSLog(@"____%@",strTime);

                [sender setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                sender.userInteractionEnabled = NO;
                
            });
            
            timeout--;
        }
        
    });
    
    dispatch_resume(_timer);
}


@end
