//
//  MyModel.h
//  Test1
//
//  Created by Meng Fan on 16/11/25.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject


@property (nonatomic , copy)NSString *title;
@property (nonatomic , retain)NSArray *list;
/** 是否是打开状态 */
@property (nonatomic , assign)BOOL isOpen;
/** 是否是选中状态 */
@property (nonatomic , assign)BOOL isSelect;

@end
