//
//  AppDelegate.h
//  Speedy
//
//  Created by Baocheng Liu on 11/9/2020.
//  Copyright © 2020 Baocheng Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;


@end

