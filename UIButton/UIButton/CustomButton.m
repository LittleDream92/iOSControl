//
//  CustomButton.m
//  UIButton
//
//  Created by Meng Fan on 16/11/10.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

//设置图片的frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(contentRect.origin.x, 0, contentRect.size.width, contentRect.size.height-20);
}

//设置标题的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(contentRect.origin.x, contentRect.size.height-20, contentRect.size.width, 20);
}

//取消高亮状态
-(void)setHighlighted:(BOOL)highlighted {
    
}



@end
