#import <UIKit/UIKit.h>

@interface LCMultiTabViewController : UIViewController

@property (strong, nonatomic) UIFont *tabMenuFont;
@property (strong, nonatomic) UIFont *tabMenuSelectedFont;
@property (strong, nonatomic) UIColor *tabMenuColor;
@property (strong, nonatomic) UIColor *tabMenuSelectedColor;
@property (assign, nonatomic) CGFloat tabMenuPadding;
@property (assign, nonatomic) CGFloat tabMenuMinimumPadding;
@property (assign, nonatomic) CGFloat tabMenuIndicatorWidth;
@property (assign, nonatomic) CGFloat tabMenuIndicatorHeight;
@property (assign, nonatomic) CGFloat tabMenuIndicatorRadius;
@property (strong, nonatomic) UIColor *tabMenuIndicatorColor;
@property (readonly, strong, nonatomic) NSArray<UIViewController *> *tabControllers;
@property (readonly, assign, nonatomic) NSInteger tabSelectedIndex;

- (BOOL)initTabWithMenu:(UIView *)menu body:(UIView *)body titles:(NSArray<NSString *> *)titles views:(NSArray<UIView *> *)views selectedIndex:(NSInteger)selectedIndex scrollEnabled:(BOOL)scrollEnabled;

- (BOOL)initTabWithMenu:(UIView *)menu body:(UIView *)body titles:(NSArray<NSString *> *)titles controllers:(NSArray<UIViewController *> *)controllers selectedIndex:(NSInteger)selectedIndex scrollEnabled:(BOOL)scrollEnabled;

- (void)selectTabAtIndex:(NSInteger)index;
- (void)setTitle:(NSString *)title forTabAtIndex:(NSInteger)index;
- (void)setBadgeWithView:(UIView *)view width:(CGFloat)width height:(CGFloat)height offset:(CGPoint)offset forTabAtIndex:(NSInteger)index;

- (void)didSelectTabAtIndex:(NSInteger)index;
- (void)didDeselectTabAtIndex:(NSInteger)index;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;

@end


