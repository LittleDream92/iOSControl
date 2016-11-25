//
//  CustomSegmentControlView.m
//  UIButton
//
//  Created by Meng Fan on 16/11/23.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "CustomSegmentControlView.h"

@interface CustomSegmentControlView ()
{
    CGFloat btnW;
    CGFloat btnH;
}


@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation CustomSegmentControlView


-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


/**
 *  自定义初始化方法
 *
 *  @param  titleArray           按钮标题
 *  @param  imgNameArray         普通状态下button图片名数组
 *  @param  selectImgNameArray   选中时button的图片名数组
 *  @param  buttonW              button的宽
 */
-(instancetype)initWithTitleArray:(NSArray *)titleArray
                     imgNameArray:(NSArray *)imgNameArray
               selectImgNameArray:(NSArray *)selectImgNameArray
                          buttonW:(CGFloat)buttonW {
    self = [super init];
    if (self) {
        self.titleArray = titleArray;
        self.imgNameArr = imgNameArray;
        self.selectImgNameArr = selectImgNameArray;
        btnW = buttonW;
        btnH = 40;
        
        [self setUpViews];
    }
    return self;
}


- (void)setUpViews {
    
    
    for (int i = 0; i < [self.titleArray count]; i++) {
        
        //创建button
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.frame = CGRectMake(i * btnW, 0, btnW, btnH);
        
        btn.backgroundColor = [UIColor clearColor];
        
        
        //设置tag值
        btn.tag = 1501 + i;
        
        
        //设置默认第一个选中
        if (btn.tag == 1501) {
            
            btn.selected = YES;
            
        }
        
        
        //判断是否有背景图片
        if ([self.imgNameArr count] > 0) {
            
            //设置背景图片
            [btn setBackgroundImage:[UIImage imageNamed:self.imgNameArr[i]] forState:UIControlStateNormal];
            
            [btn setBackgroundImage:[UIImage imageNamed:self.selectImgNameArr[i]] forState:UIControlStateSelected];
            
        }
        
        
        //设置标题
        [btn setTitleColor:self.textColor forState:UIControlStateNormal];
        
        [btn setTitleColor:_selectTextColor forState:UIControlStateSelected];
        
        btn.titleLabel.font = self.font;
        
        [btn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        
        
        //添加点击事件
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
    }
}


/*
- (void)initButtonViewWithMenuArr:(NSArray *)menuArr

                         textColor:(UIColor *)textColor

                   selectTextColor:(UIColor *)selectTextColor

                    fontSizeNumber:(NSInteger)fontSizeNumber {
    
    _menuArray = menuArr;
    
    //    //计算每个button的宽度
    //    btnW = (kScreenWidth - 40) / [_menuArray count];
    
    btnH = self.frame.size.height;
    NSLog(@"%.2f", btnH);
    
    //    NSLog(@"%d", _needLine);
    //    NSLog(@"你好");
    
    for (int i = 0; i < [_menuArray count]; i++) {
        
        //创建button
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.frame = CGRectMake(i * btnW, 0, btnW, btnH);
        
        btn.backgroundColor = [UIColor clearColor];
        
        
        //设置tag值
        btn.tag = 1501 + i;
        
        
        //设置默认第一个选中
        if (btn.tag == 1501) {
            
            btn.selected = YES;
            
        }
        
        
        //判断是否有背景图片
        if ([_imgNameArray count] > 0) {
            
            //设置背景图片
            [btn setBackgroundImage:[UIImage imageNamed:_imgNameArray[i]] forState:UIControlStateNormal];
            
            [btn setBackgroundImage:[UIImage imageNamed:_selectImgNameArray[i]] forState:UIControlStateSelected];
            
        }
        
        
        //设置标题
        [btn setTitleColor:textColor forState:UIControlStateNormal];
        
        [btn setTitleColor:selectTextColor forState:UIControlStateSelected];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:fontSizeNumber];
        
        [btn setTitle:_menuArray[i] forState:UIControlStateNormal];
        
        
        //添加点击事件
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
    }
}
*/

#pragma mark -
-(void)setTextColor:(UIColor *)textColor {
    if (_textColor != textColor) {
        _textColor = textColor;
    }
}

-(void)setSelectTextColor:(UIColor *)selectTextColor {
    if (_selectTextColor != selectTextColor) {
        _selectTextColor = selectTextColor;
    }
}

-(void)setFont:(UIFont *)font {
    if (_font != font) {
        _font = font;
    }
}

 
#pragma mark - 点击事件
/*  button的点击事件 */
- (void)btnClick:(UIButton *)button
{
    
    //遍历子视图数组，把选中button的选中值设为yes，其他设为no
    for (UIView *subView in self.subviews) {
        
        if ([subView isKindOfClass:[UIButton class]]) {
            
            UIButton *subBtn = (UIButton *)subView;
            
            if (subBtn.tag == button.tag) {
                
                [subBtn setSelected:YES];
                
            }else {
                
                [subBtn setSelected:NO];
            }
        }
    }
    
    //实现代理方法
    if ([self.myDelegate respondsToSelector:@selector(getTag:)]) {
        
        [self.myDelegate getTag:button.tag];
        
    }
}

/* 对外的，滑动到那个选中button状态下 */
- (void)scrolledWithIndex:(NSInteger)index {
    NSInteger buttonTag = 1501 + index;
    UIButton *clickBtn = [self viewWithTag:buttonTag];
    [self btnClick:clickBtn];
}

 
 
@end
