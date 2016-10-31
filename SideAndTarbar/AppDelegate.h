//
//  AppDelegate.h
//  SideAndTarbar
//
//  Created by tongle on 2016/10/31.
//  Copyright © 2016年 tongle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

