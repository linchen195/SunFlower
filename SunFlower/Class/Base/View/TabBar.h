//
//  TabBar.h
//  SunFlower
//
//  Created by 林郴 on 2017/5/23.
//  Copyright © 2017年 向日葵. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBar;

@protocol TabBarDelegate <NSObject>

@optional

- (void)tabBar:(TabBar *)tabBar didSelectedButtonFrom:(long)fromBtnTag to:(long)toBtnTag;

@end

@interface TabBar : UIView

- (void)addTabBarButtonWithTabBarItem:(UITabBarItem *)tabBarItem;

@property(nonatomic, weak)id <TabBarDelegate>delegate;

@end
