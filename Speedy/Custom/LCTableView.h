#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCTableView : UITableView

@property (strong, nonatomic) NSInteger (^numberOfSectionsBlock)(UITableView *tableView);
@property (strong, nonatomic) NSInteger (^numberOfRowsBlock)(UITableView *tableView, NSInteger section);

@property (strong, nonatomic) UIView * (^headerViewBlock)(UITableView *tableView, NSInteger section);
@property (strong, nonatomic) UIView * (^footerViewBlock)(UITableView *tableView, NSInteger section);
@property (strong, nonatomic) UITableViewCell * (^cellBlock)(UITableView *tableView, NSIndexPath *indexPath);

@property (strong, nonatomic) void (^selectBlock)(UITableView *tableView, NSIndexPath *indexPath);

- (void)commonInit;

@end

NS_ASSUME_NONNULL_END
