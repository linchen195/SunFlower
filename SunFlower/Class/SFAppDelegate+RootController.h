//
//  SFAppDelegate+RootController.h
//  SunFlower
//
//  Created by 林郴 on 2017/5/21.
//  Copyright © 2017年 向日葵. All rights reserved.
//

#import "SFAppDelegate.h"

@interface SFAppDelegate (RootController)

/**
 *  首次启动轮播图
 */
- (void)createLoadingScrollView;
/**
 *  tabbar实例
 */
- (void)setTabbarController;

/**
 *  window实例
 */
- (void)setAppWindows;

/**
 *  设置根视图
 */
- (void)setRootViewController;

@end
