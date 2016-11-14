//
//  UIButton+Extern.h
//  UIButton
//
//  Created by Meng Fan on 16/11/14.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^btnClick)(UIEvent *event);

@interface UIButton (Extern)

/**
 *  扩展Button的点击范围
 *
 *  @param top      上
 *  @param right    右
 *  @param bottom   下
 *  @param left     左
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top
                        right:(CGFloat)right
                       bottom:(CGFloat)bottom
                         left:(CGFloat)left;


/**
 *  使用block语法块，addTarget方法
 *
 *  @param event  事件
 *  @param action block action
 */
- (void)addBlockTarget:(UIControlEvents)event block:(btnClick)action;



#pragma mark - 布局
//上下居中，图片在上，文字在下
- (void)verticalCenterImageAndTitle:(CGFloat)spacing;
- (void)verticalCenterImageAndTitle; //默认6.0

//左右居中，文字在左，图片在右
- (void)horizontalCenterTitleAndImage:(CGFloat)spacing;
- (void)horizontalCenterTitleAndImage; //默认6.0

//左右居中，图片在左，文字在右
- (void)horizontalCenterImageAndTitle:(CGFloat)spacing;
- (void)horizontalCenterImageAndTitle; //默认6.0

//文字居中，图片在左边
- (void)horizontalCenterTitleAndImageLeft:(CGFloat)spacing;
- (void)horizontalCenterTitleAndImageLeft; //默认6.0

//文字居中，图片在右边
- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing;
- (void)horizontalCenterTitleAndImageRight; //默认6.0

@end
