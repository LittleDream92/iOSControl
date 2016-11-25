//
//  StretchableTableHeaderView.h
//  StretchableTableHeaderView
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HFStretchableTableHeaderView : NSObject

@property (nonatomic,retain) UITableView* tableView;
@property (nonatomic,retain) UIView* view;
@property (nonatomic,retain) UIImageView* imageView;

- (void)stretchHeaderForTableView:(UITableView*)tableView withView:(UIView*)view andHeadImageView:(UIImageView *)imageV;
- (void)scrollViewDidScroll:(UIScrollView*)scrollView;


@end
