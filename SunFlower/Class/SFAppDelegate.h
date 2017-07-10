//
//  AppDelegate.h
//  SunFlower
//
//  Created by 林郴 on 2017/5/1.
//  Copyright © 2017年 向日葵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface SFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

