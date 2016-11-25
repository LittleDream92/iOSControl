//
//  SingleChooseViewController.m
//  UIButton
//
//  Created by Meng Fan on 16/11/23.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "SingleChooseViewController.h"

//能够用CocoaPods，使用：创建多个button -> 添加到一个组 -> 设置默认选中button
#import "RadioButton.h"

@interface SingleChooseViewController ()

//>>>>>>
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) RadioButton *button1;
@property (nonatomic, strong) RadioButton *button2;
@property (nonatomic, strong) RadioButton *button3;

@property (nonatomic, strong) UILabel *selectLabel;

//>>>>>>
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) RadioButton *men;
@property (nonatomic, strong) RadioButton *women;
@property (nonatomic, strong) UIButton *change;

//>>>>>>
@property (nonatomic, strong) UIView *view3;
@property (nonatomic, strong) RadioButton *leftBtn;
@property (nonatomic, strong) RadioButton *middle;
@property (nonatomic, strong) RadioButton *rightBtn;

@end

@implementation SingleChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    [self.view addSubview:self.view3];
    [self example1];
    [self example2];
    [self example3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)example1 {
    NSMutableArray *arr = [NSMutableArray array];
    [self.view1 addSubview:self.button1];
    [self.view1 addSubview:self.button2];
    [self.view1 addSubview:self.button3];
    
    //添加到一个组里
    [arr addObject:self.button1];
    [arr addObject:self.button2];
    [arr addObject:self.button3];
    
    //设置默认选中按钮
    [self.button1 setGroupButtons:arr];
    [self.button1 setSelected:YES];
    
    [self.view1 addSubview:self.selectLabel];
}

- (void)example2 {
    [self.view2 addSubview:self.men];
    [self.view2 addSubview:self.women];
    [self.view2 addSubview:self.change];
    
    NSArray *buttons = @[self.men, self.women];
    [self.women setGroupButtons:buttons];
    [self.women setSelected:YES];
}

- (void)example3 {
    [self.view3 addSubview:self.leftBtn];
    [self.view3 addSubview:self.middle];
    [self.view3 addSubview:self.rightBtn];
    
    NSArray *buttons = @[self.leftBtn, self.middle, self.rightBtn];
    [self.leftBtn setGroupButtons:buttons];
    [self.leftBtn setSelected:YES];
}

#pragma mark - action
- (void)buttonSelectedAction:(RadioButton *)sender {
    if (sender.selected) {
        self.selectLabel.text = [NSString stringWithFormat:@"选择：%@", sender.titleLabel.text];
    }
}


- (void)changeAction:(UIButton *)sender {
    self.men.selected = !self.men.selected;
}

- (void)example3Action:(RadioButton *)sender {
    if (sender.selected) {
        NSLog(@"sender.title:%@", sender.titleLabel.text);
    }
}

#pragma mark - lazyLoading
-(UIView *)view1 {
    if (!_view1) {
        _view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
//        _view1.backgroundColor = [UIColor greenColor];
    }
    return _view1;
}

-(RadioButton *)button1 {
    if (!_button1) {
        _button1 = [RadioButton buttonWithType:UIButtonTypeCustom];
        _button1.frame = CGRectMake(10, 100, 100, 40);
        _button1.backgroundColor = [UIColor brownColor];
        [_button1 setTitle:@"选项1" forState:UIControlStateNormal];
        [_button1 setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [_button1 setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateSelected];
        [_button1 addTarget:self action:@selector(buttonSelectedAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _button1;
}

-(RadioButton *)button2 {
    if (!_button2) {
        _button2 = [RadioButton buttonWithType:UIButtonTypeCustom];
        _button2.frame = CGRectMake(10, 150, 100, 40);
        _button2.backgroundColor = [UIColor brownColor];
        [_button2 setTitle:@"选项2" forState:UIControlStateNormal];
        [_button2 setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [_button2 setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateSelected];
        [_button2 addTarget:self action:@selector(buttonSelectedAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _button2;
}

-(RadioButton *)button3 {
    if (!_button3) {
        _button3 = [RadioButton buttonWithType:UIButtonTypeCustom];
        _button3.frame = CGRectMake(10, 200, 100, 40);
        _button3.backgroundColor = [UIColor brownColor];
        [_button3 setTitle:@"选项3" forState:UIControlStateNormal];
        [_button3 setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [_button3 setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateSelected];
        [_button3 addTarget:self action:@selector(buttonSelectedAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _button3;
}

-(UILabel *)selectLabel {
    if (!_selectLabel) {
        _selectLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 150, 200, 140, 40)];
        _selectLabel.backgroundColor = [UIColor cyanColor];
        _selectLabel.text = @"选择：选项1";
    }
    return _selectLabel;
}


-(UIView *)view2 {
    if (!_view2) {
        _view2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view1.frame), self.view.bounds.size.width, 100)];
        _view2.backgroundColor = [UIColor brownColor];
    }
    return _view2;
}

-(RadioButton *)men {
    if (!_men) {
        _men = [RadioButton buttonWithType:UIButtonTypeCustom];
        _men.frame = CGRectMake(10, 20, 100, 40);
        [_men setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [_men setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateSelected];
        [_men setTitle:@"men" forState:UIControlStateNormal];
    }
    return _men;
}

-(RadioButton *)women {
    if (!_women) {
        _women = [RadioButton buttonWithType:UIButtonTypeCustom];
        _women.frame = CGRectMake(CGRectGetMaxX(self.men.frame)+10, 20, 100, 40);
        [_women setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [_women setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateSelected];
        [_women setTitle:@"women" forState:UIControlStateNormal];
    }
    return _women;
}

-(UIButton *)change {
    if (!_change) {
        _change = [UIButton buttonWithType:UIButtonTypeCustom];
        _change.frame = CGRectMake(self.view.bounds.size.width-120, 20, 100, 40);
        
        [_change setTitle:@"click" forState:UIControlStateNormal];
        [_change addTarget:self action:@selector(changeAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _change;
}

-(UIView *)view3 {
    if (!_view3) {
        _view3 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view2.frame), self.view.bounds.size.width, 100)];
//        _view3.backgroundColor = [UIColor redColor];
    }
    return _view3;
}


-(RadioButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [RadioButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame = CGRectMake(30, 40, 100, 40);
        
        [_leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_leftBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [_leftBtn setTitle:@"left" forState:UIControlStateNormal];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"2.2.png"] forState:UIControlStateNormal];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateSelected];
        [_leftBtn addTarget:self action:@selector(example3Action:) forControlEvents:UIControlEventValueChanged];
    }
    return _leftBtn;
}

-(RadioButton *)middle {
    if (!_middle) {
        _middle = [RadioButton buttonWithType:UIButtonTypeCustom];
        _middle.frame = CGRectMake(CGRectGetMaxX(self.leftBtn.frame)-1, CGRectGetMinY(self.leftBtn.frame), 100, 40);
        
        [_middle setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_middle setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [_middle setTitle:@"middle" forState:UIControlStateNormal];
        [_middle setBackgroundImage:[UIImage imageNamed:@"3.png"] forState:UIControlStateNormal];
        [_middle setBackgroundImage:[UIImage imageNamed:@"3.2.png"] forState:UIControlStateSelected];
        [_middle addTarget:self action:@selector(example3Action:) forControlEvents:UIControlEventValueChanged];
    }
    return _middle;
}

-(RadioButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [RadioButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(CGRectGetMaxX(self.middle.frame)-1, CGRectGetMinY(self.leftBtn.frame), 100, 40);
        
        [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_rightBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [_rightBtn setTitle:@"right" forState:UIControlStateNormal];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"1.2.png"] forState:UIControlStateNormal];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateSelected];
        [_rightBtn addTarget:self action:@selector(example3Action:) forControlEvents:UIControlEventValueChanged];
    }
    return _rightBtn;
}

@end
