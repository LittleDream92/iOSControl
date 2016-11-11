//
//  NumberButton.h
//  UIButton
//
//  Created by Meng Fan on 16/11/10.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol NumberButtonDelegate <NSObject>

@optional
/**
 *  加减按钮点击的回调方法
 */
- (void)numberButton:(UIView *)numberButton number:(NSString *)number;

@end


//IB_DESIGNABLE 让你的自定 UIView 可以在 IB 中预览。
IB_DESIGNABLE
@interface NumberButton : UIView

/** 加减按钮的回调 */
@property (nonatomic, copy) void(^numberBlock)(NSString *number);
/** 代理 */
@property (nonatomic, weak) id<NumberButtonDelegate> delegate;

/**
 *  通过类方法创建一个按钮实例对象
 *  
 *  @param  frame  按钮的尺寸
 *  
 *  @return 返回一个NumberButton的实例对象
 */
+ (instancetype)numberButtonWithframe:(CGRect)frame;


#pragma mark - 自定义样式设置
/**  我们经常会用一些自定义的东西完成特殊UI效果，但是怎么让自定义的东西在storyboard或者Xib中预览和修改
 
 IB_DESIGNABLE 让你的自定 UIView 可以在 IB 中预览。
 IBInspectable 让你的自定义 UIView 的属性出现在 IB 中 Attributes inspector 。
 */
/** 设置边框的颜色，默认无边框颜色 */
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

/** 是否开启抖动动画，默认NO */
@property (nonatomic, assign, getter=isShakeAnimation) IBInspectable BOOL shakeAnimation;

/** 输入框中的内容 */
@property (nonatomic, copy) NSString *currentNumber;

/** 输入框中的字体属性 */
@property (nonatomic, strong) UIFont *inputFieldFont;

/** 加减按钮的字体属性 */
@property (nonatomic, strong) UIFont *buttonTitleFont;


/** 最小值， default＝1 */
@property (nonatomic, assign) NSInteger minValue;
/** 最大值 */
@property (nonatomic, assign) NSInteger maxValue;



//注意：加减号按钮的标题和背景图片只能设置一个，若全部设置，则以最后设置的类型为准
/** 设置加／减号按钮的标题
 *
 *  @param increaseTitle 加按钮标题
 *  @param decreaseTitle 减按钮标题
 */
- (void)settitleWithIncreseTitle:(NSString *)increaseTitle decreaseTitle:(NSString *)decreaseTitle;

/**
 *  设置加／减按钮的背景图片
 *
 *  @param increaseImage 加按钮背景图片
 *  @param decreaseImage 减按钮背景图片
 */
- (void)setImageWithIncreaseImage:(UIImage *)increaseImage decreaseImage:(UIImage *)decreaseImage;


@end
