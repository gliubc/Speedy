#import <UIKit/UIKit.h>

@interface LCCollectionView : UICollectionView

@property (nonatomic, strong) UICollectionViewFlowLayout *collectionViewLayout;

@property (strong, nonatomic) NSInteger (^numberOfSectionsBlock)(UICollectionView *collectionView);
@property (strong, nonatomic) NSInteger (^numberOfItemsBlock)(UICollectionView *collectionView, NSInteger section);

@property (strong, nonatomic) UICollectionReusableView *(^supplementaryViewBlock)(UICollectionView *collectionView, NSString *kind, NSIndexPath *indexPath);
@property (strong, nonatomic) UICollectionViewCell *(^cellBlock)(UICollectionView *collectionView, NSIndexPath *indexPath);

@property (strong, nonatomic) CGSize (^sizeBlock)(UICollectionView *collectionView, UICollectionViewFlowLayout *collectionViewLayout, NSIndexPath *indexPath);
@property (strong, nonatomic) void (^selectBlock)(UICollectionView *collectionView, NSIndexPath *indexPath);

- (void)commonInit;

@end

