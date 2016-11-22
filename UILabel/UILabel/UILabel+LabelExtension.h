//
//  UILabel+LabelExtension.h
//  UILabel
//
//  Created by Meng Fan on 16/11/9.
//  Copyright © 2016年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LabelExtension)


/**
 NSMutableAttributedString可以设置label的常用的属性。  我们先说一下和 attributes有关的四个方法：
 
 为某一范围内文字设置多个属性
 - (void)setAttributes:(NSDictionary*)attrs range:(NSRange)range;
 
 为某一范围内文字添加某个属性
 - (void)addAttribute:(NSString*)name value:(id)value range:(NSRange)range;
 
 为某一范围内文字添加多个属性
 - (void)addAttributes:(NSDictionary*)attrs range:(NSRange)range;
 
 移除某一范围内的某个属性
 - (void)removeAttribute:(NSString*)name range:(NSRange)range;
 
 */


/** 设置不同颜色的字体
 *  @param label : label
 *  @param color : 设置成的特殊颜色
 *  @param colorText  设置特殊颜色的字体
 */
- (void)changeColorWithColor:(UIColor *)color
                   colorText:(NSString *)colorText;

/** 设置不同大小字体的字体
 *  @param font  目标文字的字体设置
 *  @param fontText 目标文字
 */
- (void)changeFontWithFont:(UIFont *)font
                  fontText:(NSString *)fontText;


/** 设置中划线
 *  @param text  要设置中划线的字体
 */
- (void)setThroughLineWithText:(NSString *)text;

/** 设置中划线——自定义颜色
 *  @param text 要设置中划线的字体
 *  @param textColor    要设置中划线的颜色
 */
- (void)setThroughLineWithText:(NSString *)text color:(UIColor *)textColor;



/** 设置下划线
 *  @param text  要设置下划线的字体
 */
- (void)setUnderLineWithText:(NSString *)text;

/** 设置下划线——自定义颜色
 *  @param text 要设置下划线的字体
 *  @param textColor    要设置下划线的颜色
 */
- (void)setUnderLineWithText:(NSString *)text color:(UIColor *)textColor;


/** 设置多行label的行距
 */
- (void)changeLabelSpaceWithSpace:(NSInteger)space text:(NSString *)text;


/**
 *  固定宽度求高度
 *  @param string   文本内容
 *  @param width    固定的宽度
 *  @param font     字体
 */
- (CGFloat)heightForString:(NSString *)string width:(CGFloat)width font:(UIFont *)font;


/**
 *  固定高度求宽度
 *  @param string   文本内容
 *  @param height   固定的高度
 *  @param font     字体
 */
- (CGFloat)widthForString:(NSString *)string height:(CGFloat)height font:(UIFont *)font;



@end
