//
//  RightTableViewCell.h
//  UITableView
//
//  Created by Meng Fan on 16/11/29.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCellIdentifier_Right @"RightTableViewCell"

@class FoodModel;
@interface RightTableViewCell : UITableViewCell

@property (nonatomic, strong) FoodModel *model;

@end
