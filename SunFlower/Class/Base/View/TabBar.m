//
//  TabBar.m
//  SunFlower
//
//  Created by 林郴 on 2017/5/23.
//  Copyright © 2017年 向日葵. All rights reserved.
//

#import "TabBar.h"
#import "TabBarButton.h"

@interface TabBar ()

@property(nonatomic,strong)NSMutableArray *itemArray;

@property(nonatomic,strong)TabBarButton *tabBarButton;

@end

@implementation TabBar

-(NSMutableArray *)itemArray{

    if (!_itemArray) {
        _itemArray = [[NSMutableArray alloc]init];
    }
    return _itemArray;
}

-(instancetype)init{

    if (self=[super init]) {
        self.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.5 alpha:1];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width/(self.subviews.count);
    CGFloat btnH = self.frame.size.height;
    
    for (int nIndex = 0; nIndex < self.itemArray.count; nIndex++) {
        CGFloat btnX = btnW * nIndex;
        TabBarButton *tabBarBtn = self.itemArray[nIndex];
        tabBarBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        tabBarBtn.tag = nIndex;
    }
}

- (void)addTabBarButtonWithTabBarItem:(UITabBarItem *)tabBarItem{
    TabBarButton *tabBarBtn = [[TabBarButton alloc] init];
    tabBarBtn.tabBarItem = tabBarItem;
    [tabBarBtn addTarget:self action:@selector(ClickTabBarButton:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:tabBarBtn];
    [self.itemArray addObject:tabBarBtn];
    
    //default selected first one
    if (self.itemArray.count == 1) {
        [self ClickTabBarButton:tabBarBtn];
    }
}

- (void)ClickTabBarButton:(TabBarButton *)tabBarBtn{
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.tabBarButton.tag to:tabBarBtn.tag];
    }
    
    self.tabBarButton.selected = NO;
    tabBarBtn.selected = YES;
    self.tabBarButton = tabBarBtn;
}


@end
