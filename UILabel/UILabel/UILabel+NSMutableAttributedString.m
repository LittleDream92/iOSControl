//
//  UILabel+NSMutableAttributedString.m
//  UILabel
//
//  Created by Meng Fan on 16/11/22.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "UILabel+NSMutableAttributedString.h"
#import <CoreText/CoreText.h>

@implementation UILabel (NSMutableAttributedString)
//获取斜体
UIFont * GetVariationOfFontWithTrait(UIFont *baseFont,
                                     CTFontSymbolicTraits trait) {
    CGFloat fontSize = [baseFont pointSize];
    CFStringRef
    baseFontName = (__bridge CFStringRef)[baseFont fontName];
    CTFontRef baseCTFont = CTFontCreateWithName(baseFontName,
                                                fontSize, NULL);
    CTFontRef ctFont =
    CTFontCreateCopyWithSymbolicTraits(baseCTFont, 0, NULL,
                                       trait, trait);
    NSString *variantFontName =
    CFBridgingRelease(CTFontCopyName(ctFont,
                                     kCTFontPostScriptNameKey));
    
    UIFont *variantFont = [UIFont fontWithName:variantFontName
                                          size:fontSize];
    CFRelease(ctFont);
    CFRelease(baseCTFont);
    return variantFont;
};






#pragma mark - 设置 字段字体
/** 设置不同大小字体的字体
 *  @param font  目标文字的字体设置
 *  @param fontText 目标文字
 */
- (void)mf_changeFontWithFont:(UIFont *)font
                  fontText:(NSString *)fontText {
    //获取label的带属性的字符串
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //计算颜色字符串的范围
    NSRange fontRange = NSMakeRange([[textString string] rangeOfString:fontText].location, [[textString string] rangeOfString:fontText].length);
    //设置属性
    [textString addAttribute:NSFontAttributeName value:font range:fontRange];
    
    self.attributedText = textString;
}

#pragma mark - 设置 字段间距
/**
 *  设置所有的字段间距
 *
 *  @param space    字段间距
 */
- (void)mf_changeTextSpaceWithSpace:(NSInteger)space {
    [self mf_changeTextSpaceWithSpace:space text:self.text];
}

/**
 *  设置某些字段间距
 *
 *  @param space    字段间距
 *  @param text     字段
 */
- (void)mf_changeTextSpaceWithSpace:(NSInteger)space
                               text:(NSString *)text {
    //获取label的带属性的字符串
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    NSRange textRange = [self.text rangeOfString:text options:NSCaseInsensitiveSearch];
    if (textRange.location != NSNotFound) {
        [textString addAttribute:(id)kCTKernAttributeName value:@(space) range:textRange];
    }
    
    self.attributedText = textString;
}


#pragma mark - 改变行间距
/**
 *  设置所有的行间距
 *
 *  @param space    行间距
 */
- (void)mf_changeLabelSpaceWithSpace:(NSInteger)space {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [self mf_changeLabelSpaceWithTextParagraphStyle:paragraphStyle];
}

/**
 *  设置某些段落的行间距
 *
 *  @param paragraphStyle   段落样式
 */
- (void)mf_changeLabelSpaceWithTextParagraphStyle:(NSParagraphStyle *)paragraphStyle {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    [self setAttributedText:attributedString];
}



#pragma mark - 改变字段 字体颜色
/** 设置某个字段的字体颜色
 *
 *  @param color        设置成的特殊颜色
 *  @param colorText    设置特殊颜色的字体
 */
- (void)mf_changeColorWithColor:(UIColor *)color
                      colorText:(NSString *)colorText {
    [self mf_changeColorWithColor:color colorTexts:@[colorText]];
}


/** 设置某些字段的字体颜色
 *
 *  @param color        设置成的特殊颜色
 *  @param colorText    设置特殊颜色的字体们
 */
- (void)mf_changeColorWithColor:(UIColor *)color
                     colorTexts:(NSArray *)colorTexts {
    //获取label的带属性的字符串
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    for (NSString *text in colorTexts) {
        NSRange textRange = [self.text rangeOfString:text options:NSBackwardsSearch];
        if (textRange.location != NSNotFound) {
            [attributedString addAttribute:NSForegroundColorAttributeName value:color range:textRange];
        }
    }
    self.attributedText = attributedString;
}

#pragma mark - 改变字段 背景颜色
/**
 *  改变某些字段的背景颜色
 *
 *  @param  color   设置的背景颜色
 *  @param  text    设置背景颜色的字段
 */
- (void)mf_changeBgColorWithColor:(UIColor *)bgColor
                       textString:(NSString *)text {
    //获取label的带属性的字符串
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    NSRange textRange = [self.text rangeOfString:text options:NSBackwardsSearch];
    if (textRange.location != NSNotFound) {
        [attributedString addAttribute:NSBackgroundColorAttributeName value:bgColor range:textRange];
    }
    
    self.attributedText = attributedString;
}


#pragma mark - 设置删除线
/** 设置中划线
 *  @param text  要设置中划线的字体
 */
- (void)mf_setThroughLineWithText:(NSString *)text {
    //获取label的带属性的字符串
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    //计算颜色字符串的范围
    NSRange lineRange = NSMakeRange([[textString string] rangeOfString:text].location, [[textString string] rangeOfString:text].length);
    
    NSDictionary *dic = @{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],};
    [textString addAttributes:dic range:lineRange];
    
    self.attributedText = textString;
}

/** 设置下划线
 *  @param text  要设置下划线的字体
 */
- (void)mf_setUnderLineWithText:(NSString *)text {
    //获取label的带属性的字符串
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    //计算颜色字符串的范围
    NSRange lineRange = NSMakeRange([[textString string] rangeOfString:text].location, [[textString string] rangeOfString:text].length);
    
    NSDictionary *dic = @{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    [textString addAttributes:dic range:lineRange];
    
    self.attributedText = textString;
}

#pragma mark - 设置字的 删除线颜色
/** 设置中划线——自定义颜色
 *  @param text 要设置中划线的字体
 *  @param textColor    要设置中划线的颜色
 */
- (void)mf_setThroughLineWithText:(NSString *)text color:(UIColor *)textColor {
    //获取label的带属性的字符串
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    //计算颜色字符串的范围
    NSRange lineRange = NSMakeRange([[textString string] rangeOfString:text].location, [[textString string] rangeOfString:text].length);
    
    [textString addAttribute:NSStrikethroughColorAttributeName value:textColor range:lineRange];
    
    self.attributedText = textString;
}


/** 设置下划线——自定义颜色
 *  @param text 要设置下划线的字体
 *  @param textColor    要设置下划线的颜色
 */
- (void)mf_setUnderLineWithText:(NSString *)text color:(UIColor *)textColor {
    //获取label的带属性的字符串
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    //计算颜色字符串的范围
    NSRange lineRange = NSMakeRange([[textString string] rangeOfString:text].location, [[textString string] rangeOfString:text].length);
    [textString addAttribute:NSUnderlineColorAttributeName value:textColor range:lineRange];
    
    self.attributedText = textString;
}

#pragma mark - 设置字段斜体
/**
 *  设置某个字段斜体
 *
 *  @param text     倾斜的字段
 *  @param  obliqueness 倾斜角度
 */
- (void)mf_changeTextItalicWithString:(NSString *)text Obliqueness:(NSNumber *)obliqueness {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    NSRange textRange = [self.text rangeOfString:text options:NSBackwardsSearch];
    if (textRange.location != NSNotFound) {
        [attributedString addAttribute:NSObliquenessAttributeName value:obliqueness range:textRange];
    }
    self.attributedText = attributedString;
}


#pragma mark - 设置 两端对齐
/**
 *  设置字段两端对齐
 *
 *  @param textCTKern 改变的对齐
 */
- (void)mf_changeCTKernWithTextCTKern:(NSNumber *)textCTKern {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    [attributedString addAttribute:(id)kCTKernAttributeName value:textCTKern range:NSMakeRange(0, self.text.length-1)];
    self.attributedText = attributedString;
}

#pragma mark - 设置字的基准线偏移 value>0坐标往上偏移 value<0坐标往下偏移
/**
 *  设置所有字段的基准线偏移
 *
 *  @param textBaselineOffset 改变的偏移大小
 */
- (void)mf_changeBaselineOffsetWithTextBaselineOffset:(NSNumber *)textBaselineOffset NS_AVAILABLE(10_0, 7_0) {
    [self mf_changeBaselineOffsetWithTextBaselineOffset:textBaselineOffset changeText:self.text];
}
/**
 *  设置 某些字段的基准线偏移
 *
 *  @param textBaselineOffset 改变的偏移大小
 *  @param text               改变的字段
 */
- (void)mf_changeBaselineOffsetWithTextBaselineOffset:(NSNumber *)textBaselineOffset changeText:(NSString *)text NS_AVAILABLE(10_0, 7_0) {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    NSRange textRange = [self.text rangeOfString:text options:NSBackwardsSearch];
    if (textRange.location != NSNotFound) {
        [attributedString addAttribute:NSBaselineOffsetAttributeName value:textBaselineOffset range:textRange];
    }
    self.attributedText = attributedString;
}


#pragma mark - 返回字符串的尺寸

/**
 *  固定宽度求高度
 *  @param string   文本内容
 *  @param width    固定的宽度
 *  @param font     字体
 */
- (CGFloat)mf_heightForString:(NSString *)string width:(CGFloat)width font:(UIFont *)font {
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
- (CGFloat)mf_widthForString:(NSString *)string height:(CGFloat)height font:(UIFont *)font {
    NSDictionary *attr = @{NSFontAttributeName: font};
    CGSize sizeToFit = [string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                                            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                         attributes:attr
                                            context:nil].size;
    //此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.width;
}



@end
