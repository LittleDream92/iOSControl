//
//  MyModel.m
//  Test1
//
//  Created by Meng Fan on 16/11/25.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    _isOpen = NO;
    _isSelect = NO;
}

@end
