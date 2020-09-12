//
//  LocationService.m
//  LNMobileProject
//
//  Created by 六牛科技 on 2018/7/11.
//
//  山东六牛网络科技有限公司 https://liuniukeji.com
//

#import <CoreLocation/CoreLocation.h>
#import "LocationService.h"

@interface LocationService () <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) void (^success)(NSArray<CLLocation *> *locations);
@property (strong, nonatomic) void (^failure)(NSString *errorMessage);

@end

@implementation LocationService

- (void)locateWithSuccess:(void(^)(NSArray<CLLocation *> *locations))success failure:(void(^)(NSString *errorMessage))failure {
    // 初始化定位管理器
    if (!self.locationManager) {
        self.locationManager = [CLLocationManager new];
        self.locationManager.delegate = self;
    }

    // 绑定回调
    self.success = success;
    self.failure = failure;

    // 判断定位服务是否开启
    if (![CLLocationManager locationServicesEnabled]) {
        if (self.failure) {
            self.failure(@"您的设备尚未开启定位服务，无法获取当前位置信息。（如何开启定位服务？前往设置 > 隐私 > 定位服务 > 打开定位服务）");
        }
        return;
    }

    // iOS8.0以上的用户需要授权
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        //调用此方法之前必须在plist文件中添加NSLocationWhenInUseUsageDescription --string-- 后面跟的文字就是提示信息
        [self.locationManager requestWhenInUseAuthorization];
    }

    // 开始定位
    [self.locationManager startUpdatingLocation];
}

#pragma mark - Location manager

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [manager stopUpdatingLocation];
    manager.delegate = nil;

    if (self.failure) {
        self.failure(@"获取位置信息失败，请检查当前应用是否允许访问位置信息：设置 > 隐私 > 定位服务 > 当前应用");
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [manager stopUpdatingLocation];
    manager.delegate = nil;

    if (self.success) {
        self.success(locations);
    }
}


@end
