//
//  StretchableTableHeaderView.m
//  StretchableTableHeaderView
//

#import "HFStretchableTableHeaderView.h"

@interface HFStretchableTableHeaderView()
{
    CGRect initialFrame;
    CGFloat defaultViewHeight;
    CGRect initialImgeFrame;
    CGFloat defaultimageHeight;
    CGFloat defaultimageY;
}
@end


@implementation HFStretchableTableHeaderView


- (void)stretchHeaderForTableView:(UITableView*)tableView withView:(UIView*)view andHeadImageView:(UIImageView *)imageV
{
    _tableView                   = tableView;
    _view                        = view;
    _imageView                   = imageV;
    initialFrame                 = _view.frame;
    defaultViewHeight            = initialFrame.size.height;
    defaultimageY                = imageV.frame.origin.y;
    initialImgeFrame             = imageV.frame;
    defaultimageHeight           = imageV.frame.size.height;
    UIView* emptyTableHeaderView = [[UIView alloc] initWithFrame:initialFrame];
    _tableView.tableHeaderView   = emptyTableHeaderView;
    [_tableView addSubview:_view];
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    if(scrollView.contentOffset.y < 0) {
        CGFloat offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
        initialFrame.origin.y = offsetY * -1;
        initialFrame.size.height = defaultViewHeight + offsetY;
        initialImgeFrame.size.height =defaultimageHeight + offsetY;
        initialImgeFrame.size.width  =defaultimageHeight+ offsetY;
        _imageView.frame=initialImgeFrame;
        _view.frame = initialFrame;
        _imageView.center=CGPointMake(_view.center.x, defaultimageY+initialImgeFrame.size.height/2);
        _imageView.layer.cornerRadius=initialImgeFrame.size.height*0.5;
    }
}
 


@end
