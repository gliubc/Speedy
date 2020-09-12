//
//  LocationService.h
//  LNMobileProject
//
//  Created by 六牛科技 on 2018/7/11.
//
//  山东六牛网络科技有限公司 https://liuniukeji.com
//

#import <Foundation/Foundation.h>

@interface LocationService : NSObject

- (void)locateWithSuccess:(void(^)(NSArray<CLLocation *> *locations))success failure:(void(^)(NSString *errorMessage))failure;

@end
