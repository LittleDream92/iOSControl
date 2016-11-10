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

@end
