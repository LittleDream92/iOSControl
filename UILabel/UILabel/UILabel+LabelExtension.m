//
//  UILabel+LabelExtension.m
//  UILabel
//
//  Created by Meng Fan on 16/11/9.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "UILabel+LabelExtension.h"

@implementation UILabel (LabelExtension)

/** 设置不同颜色的字体 
 *  @param label : label
 *  @param color : 设置成的特殊颜色
 *  @param colorText  设置特殊颜色的字体
 */
- (void)changeColorWithColor:(UIColor *)color
                   colorText:(NSString *)colorText {
    
    //获取label的带属性的字符串
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //计算颜色字符串的范围
    NSRange colorRange = NSMakeRange([[textString string] rangeOfString:colorText].location, [[textString string] rangeOfString:colorText].length);
    //设置属性
    [textString addAttribute:NSForegroundColorAttributeName value:color range:colorRange];
    
    self.attributedText = textString;
}


/** 设置不同大小字体的字体
 *  @param font  目标文字的字体设置
 *  @param fontText 目标文字
 */
- (void)changeFontWithFont:(UIFont *)font
                  fontText:(NSString *)fontText {
    //获取label的带属性的字符串
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //计算颜色字符串的范围
    NSRange fontRange = NSMakeRange([[textString string] rangeOfString:fontText].location, [[textString string] rangeOfString:fontText].length);
    //设置属性
    [textString addAttribute:NSFontAttributeName value:font range:fontRange];
    
    self.attributedText = textString;
}


/** 设置中划线
 *  @param text  要设置中划线的字体
 */
- (void)setThroughLineWithText:(NSString *)text {
    //获取label的带属性的字符串
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    //计算颜色字符串的范围
    NSRange lineRange = NSMakeRange([[textString string] rangeOfString:text].location, [[textString string] rangeOfString:text].length);
    
    NSDictionary *dic = @{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],};
    [textString addAttributes:dic range:lineRange];
   
    self.attributedText = textString;
}

/** 设置中划线——自定义颜色
 *  @param text 要设置中划线的字体
 *  @param textColor    要设置中划线的颜色
 */
- (void)setThroughLineWithText:(NSString *)text color:(UIColor *)textColor {
    //获取label的带属性的字符串
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    //计算颜色字符串的范围
    NSRange lineRange = NSMakeRange([[textString string] rangeOfString:text].location, [[textString string] rangeOfString:text].length);
    
    [textString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:lineRange];
    [textString addAttribute:NSStrikethroughColorAttributeName value:textColor range:lineRange];
    
    self.attributedText = textString;
}


/** 设置下划线
 *  @param text  要设置下划线的字体
 */
- (void)setUnderLineWithText:(NSString *)text {
    //获取label的带属性的字符串
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    //计算颜色字符串的范围
    NSRange lineRange = NSMakeRange([[textString string] rangeOfString:text].location, [[textString string] rangeOfString:text].length);
    
    NSDictionary *dic = @{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    [textString addAttributes:dic range:lineRange];
    
    self.attributedText = textString;
}

/** 设置下划线——自定义颜色
 *  @param text 要设置下划线的字体
 *  @param textColor    要设置下划线的颜色
 */
- (void)setUnderLineWithText:(NSString *)text color:(UIColor *)textColor {
    //获取label的带属性的字符串
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    //计算颜色字符串的范围
    NSRange lineRange = NSMakeRange([[textString string] rangeOfString:text].location, [[textString string] rangeOfString:text].length);
    
    [textString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:lineRange];
    [textString addAttribute:NSUnderlineColorAttributeName value:textColor range:lineRange];
    
    self.attributedText = textString;
}


/** 设置多行label的行距
 *  @param space  行距
 */
- (void)changeLabelSpaceWithSpace:(NSInteger)space  text:(NSString *)text {
    //获取label的带属性的字符串
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    [paraStyle setLineSpacing:space];
    
    [textString addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, [text length])];
    
    self.attributedText = textString;
}


/**
 *  固定宽度求高度
 *  @param string   文本内容
 *  @param width    固定的宽度
 *  @param font     字体
 */
- (CGFloat)heightForString:(NSString *)string width:(CGFloat)width font:(UIFont *)font {
    
    NSDictionary *attr = @{NSFontAttributeName: font};
    CGSize sizeToFit = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                        attributes:attr
                                           context:nil].size;
    //此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.width;
}


/**
 *  固定高度求宽度
 *  @param string   文本内容
 *  @param height   固定的高度
 *  @param font     字体
 */
- (CGFloat)widthForString:(NSString *)string height:(CGFloat)height font:(UIFont *)font {
    NSDictionary *attr = @{NSFontAttributeName: font};
    CGSize sizeToFit = [string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                                            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                         attributes:attr
                                            context:nil].size;
    //此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.width;
}


/**
 *  设置多行文本两端对齐
 */
- (void)setLabelParagraphStyleJustifiedWithString:(NSString *)string {
    //获取label的带属性的字符串
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentJustified;     // 对齐方式, 设置为两端对齐。
    style.paragraphSpacing = 0;                     // 段落后的间距
    style.paragraphSpacingBefore = 0;               // 段落前的间距
    style.firstLineHeadIndent = 2.0;                  // 段落第一句缩进
    style.headIndent = 0;                           // 头部缩进(不包括段落第一句)
    
    [textString setAttributes:@{NSParagraphStyleAttributeName : style} range:NSMakeRange(0, [string length])];
    
    self.attributedText = textString;
}


@end
