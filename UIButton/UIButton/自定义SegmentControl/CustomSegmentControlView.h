//
//  CustomSegmentControlView.h
//  UIButton
//
//  Created by Meng Fan on 16/11/23.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

/*用button自定义类似于segmentContrl的view控件*/
#import <UIKit/UIKit.h>


//协议
@protocol CustomButtonProtocol <NSObject>

- (void)getTag:(NSInteger)tag;//获取当前选中下标

@end







@interface CustomSegmentControlView : UIView

//delegate
@property (nonatomic, strong)id <CustomButtonProtocol> myDelegate;


/** 正常状态下的文字颜色 */
@property (nonatomic, strong) UIColor *textColor;

/** 选中状态下的文字颜色 */
@property (nonatomic, strong) UIColor *selectTextColor;
 
/** 文字字体 */
@property (nonatomic, strong) UIFont *font;

/** 背景图片数组 */
@property (nonatomic, strong) NSArray *imgNameArr;

/** 选中背景图片数组 */
@property (nonatomic, strong) NSArray *selectImgNameArr;

#pragma mark - init methods
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
                          buttonW:(CGFloat)buttonW;



/*
 *  自定义button视图的样式
 *  menuArr       button的title数组
 *  textColor     字体颜色
 *  selectTextColor  选中字体颜色
 * fontSizeNumber 字体大小
 * needLine       是否需要下划线


- (void)initButtonViewWithMenuArr:(NSArray *)menuArr

                         textColor:(UIColor *)textColor

                   selectTextColor:(UIColor *)selectTextColor

                    fontSizeNumber:(NSInteger)fontSizeNumber;

 */
/* 对外的，滑动到那个选中button状态下 */
- (void)scrolledWithIndex:(NSInteger)index;


@end
