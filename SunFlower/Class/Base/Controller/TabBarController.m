//
//  TabBarController.m
//  SunFlower
//
//  Created by 林郴 on 2017/6/5.
//  Copyright © 2017年 向日葵. All rights reserved.
//

#import "TabBarController.h"
#import "TabBar.h"

#import "FlowerViewController.h"
#import "MineViewController.h"
#import "PublishViewController.h"
#import "StationViewController.h"
#import "TopicViewController.h"

@interface TabBarController ()<TabBarDelegate>

@property(nonatomic, weak)TabBar *autoTabBar;

@end

@implementation TabBarController

+(instancetype)shareInstance{

    static TabBarController *instance = nil;
    static dispatch_once_t tocken;

    dispatch_once(&tocken, ^{
        
        instance = [[TabBarController alloc] init];
    });
    
    return instance;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if([child isKindOfClass:[UIControl class]]){
            [child removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTabBar];
    [self setupAllControllers];
}

- (void)setupTabBar{
    TabBar *tabBar = [[TabBar alloc] init];
    tabBar.frame = self.tabBar.bounds;
    tabBar.delegate = self;
    [self.tabBar addSubview:tabBar];
    _autoTabBar = tabBar;
}

- (void)setupAllControllers{
    
    
    NSArray *titles = @[@"首页", @"县区", @"工具", @"我的"];
    NSArray *images = @[@"tabbar_home_default", @"tabbar_municipios_default", @"tabbar_tools_default", @"tabbar_mine_default"];
    NSArray *selectedImages = @[@"tabbar_home_select", @"tabbar_municipios_select", @"tabbar_tools_select", @"tabbar_mine_select"];
    
    
    //    self.viewControllers=@[homePage,municipio,tools,mine];
    FlowerViewController *flower = [[FlowerViewController alloc]init];
    StationViewController *station = [[StationViewController alloc]init];
    station.view.backgroundColor = [UIColor redColor];
    PublishViewController *publish = [[PublishViewController alloc]init];
    TopicViewController *topic = [[TopicViewController alloc]init];
    MineViewController *mine = [[MineViewController alloc]init];
    
    NSArray *viewControllers = @[flower,topic,publish,station];
    
    for (int i = 0; i < viewControllers.count; i++) {
        UIViewController *childVc = viewControllers[i];
        [self SetupChildVc:childVc title:titles[i] image:images[i] selectedImage:selectedImages[i]];
    }
}


- (void)SetupChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName{
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:childVc];
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.title = title;
    [self.autoTabBar addTabBarButtonWithTabBarItem:childVc.tabBarItem];
    [self addChildViewController:nav];
}



#pragma mark --------------------mainTabBar delegate
- (void)tabBar:(TabBar *)tabBar didSelectedButtonFrom:(long)fromBtnTag to:(long)toBtnTag{
    self.selectedIndex = toBtnTag;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
