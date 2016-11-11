//
//  NSString+NumberButton.m
//  UIButton
//
//  Created by Meng Fan on 16/11/10.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "NSString+NumberButton.h"

@implementation NSString (NumberButton)

/**
 判断字符串 nil, @"", @" ", @"\n" returns NO
 其他  return YES
 */
- (BOOL)isNotBlank {
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

@end
