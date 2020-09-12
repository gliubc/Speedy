#import "LCCollectionView.h"

@interface LCCollectionView () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@end

@implementation LCCollectionView

@dynamic collectionViewLayout;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (![self.collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]]) {
        self.collectionViewLayout = [UICollectionViewFlowLayout new];
    }
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (![layout isKindOfClass:[UICollectionViewFlowLayout class]]) {
        layout = [UICollectionViewFlowLayout new];
    }
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.dataSource = self;
    self.delegate = self;
    
    self.collectionViewLayout.minimumInteritemSpacing = 0;
    self.collectionViewLayout.minimumLineSpacing = 0;
}

#pragma mark - Collection view

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (self.numberOfSectionsBlock) {
        return self.numberOfSectionsBlock(collectionView);
    }
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.numberOfItemsBlock) {
        return self.numberOfItemsBlock(collectionView, section);
    }
    return 0;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (self.supplementaryViewBlock) {
        return self.supplementaryViewBlock(collectionView, kind, indexPath);
    }
    return nil;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell;
    if (self.cellBlock) {
        cell = self.cellBlock(collectionView, indexPath);
    } else {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sizeBlock) {
        return self.sizeBlock(collectionView, (UICollectionViewFlowLayout *)collectionViewLayout, indexPath);
    }
    return CGSizeZero;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectBlock) {
        self.selectBlock(collectionView, indexPath);
    }
}

@end

