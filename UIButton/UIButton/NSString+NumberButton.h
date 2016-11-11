//
//  NSString+NumberButton.h
//  UIButton
//
//  Created by Meng Fan on 16/11/10.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NumberButton)

/**
    判断字符串 nil, @"", @" ", @"\n" returns NO
    其他  return YES
 */
- (BOOL)isNotBlank;

@end
