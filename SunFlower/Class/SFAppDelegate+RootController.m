//
//  SFAppDelegate+RootController.m
//  SunFlower
//
//  Created by 林郴 on 2017/5/21.
//  Copyright © 2017年 向日葵. All rights reserved.
//

#import "SFAppDelegate+RootController.h"
#import "TabBarController.h"

@implementation SFAppDelegate (RootController)

- (void)setRootViewController{
    
}

- (void)setTabbarController{

}

- (void)setAppWindows{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    TabBarController *tabBarCon = [TabBarController shareInstance];
    
    self.window.rootViewController = tabBarCon;
    
    [self.window makeKeyAndVisible];
}


- (void)createLoadingScrollView{
    //引导页实例
}
@end
