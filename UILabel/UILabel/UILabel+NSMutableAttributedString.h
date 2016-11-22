//
//  UILabel+NSMutableAttributedString.h
//  UILabel
//
//  Created by Meng Fan on 16/11/22.
//  Copyright © 2016年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (NSMutableAttributedString)

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


#pragma mark - 设置 字段字体

/** 设置某些字段的字体
 *  @param font  目标文字的字体
 *  @param fontText 目标文字
 */
- (void)mf_changeFontWithFont:(UIFont *)font
                  fontText:(NSString *)fontText;

#pragma mark - 设置 字段间距
/**
 *  设置所有的字段间距
 *
 *  @param space    字段间距
 */
- (void)mf_changeTextSpaceWithSpace:(NSInteger)space;

/**
 *  设置某些字段间距
 *
 *  @param space    字段间距
 *  @param text     字段
 */
- (void)mf_changeTextSpaceWithSpace:(NSInteger)space
                            text:(NSString *)text;

#pragma mark - 设置 行间距
/**
 *  设置所有的行间距
 *
 *  @param space    行间距
 */
- (void)mf_changeLabelSpaceWithSpace:(NSInteger)space;

/**
 *  设置某些段落的行间距
 *
 *  @param paragraphStyle   段落样式
 */
- (void)mf_changeLabelSpaceWithTextParagraphStyle:(NSParagraphStyle *)paragraphStyle;


#pragma mark - 设置字段 字体颜色
/** 设置某个字段的字体颜色
 *
 *  @param color        设置成的特殊颜色
 *  @param colorText    设置特殊颜色的字体
 */
- (void)mf_changeColorWithColor:(UIColor *)color
                   colorText:(NSString *)colorText;


/** 设置某些字段的字体颜色
 *
 *  @param color        设置成的特殊颜色
 *  @param colorText    设置特殊颜色的字体们
 */
- (void)mf_changeColorWithColor:(UIColor *)color
                  colorTexts:(NSArray *)colorTexts;

#pragma mark -设置字段 背景颜色
/**
 *  改变某些字段的背景颜色
 *
 *  @param  color   设置的背景颜色
 *  @param  text    设置背景颜色的字段
 */
- (void)mf_changeBgColorWithColor:(UIColor *)bgColor
                       textString:(NSString *)text;



#pragma mark - 设置删除线
/** 设置中划线
 *  @param text  要设置中划线的字体
 */
- (void)mf_setThroughLineWithText:(NSString *)text;

/** 设置下划线
 *  @param text  要设置下划线的字体
 */
- (void)mf_setUnderLineWithText:(NSString *)text;


#pragma mark - 设置字的 删除线颜色
/** 设置中划线——自定义颜色
 *  @param text 要设置中划线的字体
 *  @param textColor    要设置中划线的颜色
 */
- (void)mf_setThroughLineWithText:(NSString *)text color:(UIColor *)textColor;


/** 设置下划线——自定义颜色
 *  @param text 要设置下划线的字体
 *  @param textColor    要设置下划线的颜色
 */
- (void)mf_setUnderLineWithText:(NSString *)text color:(UIColor *)textColor;


#pragma mark - 设置字段斜体  value>0向右倾斜 value<0向左倾斜
/**
 *  设置某个字段斜体
 *
 *  @param text     倾斜的字段
 *  @param  obliqueness 倾斜角度
 */
- (void)mf_changeTextItalicWithString:(NSString *)text Obliqueness:(NSNumber *)obliqueness;


#pragma mark - 设置 两端对齐
/**
 *  设置字段两端对齐
 *
 *  @param textCTKern 改变的对齐
 */
- (void)mf_changeCTKernWithTextCTKern:(NSNumber *)textCTKern;


#pragma mark - 设置字的基准线偏移 value>0坐标往上偏移 value<0坐标往下偏移
/**
 *  设置所有字段的基准线偏移
 *
 *  @param textBaselineOffset 改变的偏移大小
 */
- (void)mf_changeBaselineOffsetWithTextBaselineOffset:(NSNumber *)textBaselineOffset NS_AVAILABLE(10_0, 7_0);
/**
 *  设置 某些字段的基准线偏移
 *
 *  @param textBaselineOffset 改变的偏移大小
 *  @param text               改变的字段
 */
- (void)mf_changeBaselineOffsetWithTextBaselineOffset:(NSNumber *)textBaselineOffset changeText:(NSString *)text NS_AVAILABLE(10_0, 7_0);


#pragma mark - 返回字符串的尺寸

/**
 *  固定宽度求高度
 *  @param string   文本内容
 *  @param width    固定的宽度
 *  @param font     字体
 */
- (CGFloat)mf_heightForString:(NSString *)string width:(CGFloat)width font:(UIFont *)font;


/**
 *  固定高度求宽度
 *  @param string   文本内容
 *  @param height   固定的高度
 *  @param font     字体
 */
- (CGFloat)mf_widthForString:(NSString *)string height:(CGFloat)height font:(UIFont *)font;




@end
