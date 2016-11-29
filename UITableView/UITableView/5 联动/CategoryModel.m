//
//  CategoryModel.m
//  UITableView
//
//  Created by Meng Fan on 16/11/29.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "CategoryModel.h"
#import "NSObject+Property.h"

@implementation CategoryModel

+(NSDictionary *)objectClassInArray {
    return @{@"spus" : @"FoodModel"};
}

@end





@implementation FoodModel

+(NSDictionary *)replacedKeyFromPropertyName  {
    return @{@"foodId" : @"id"};
}

@end
