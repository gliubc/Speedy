#import "NestedScrollView.h"

@interface NestedScrollView () <UIGestureRecognizerDelegate>

@end;

@implementation NestedScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
