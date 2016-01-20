//
//  BaseViewController.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/11.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "BaseViewController.h"
#import "WeiChatHomeViewController.h"
#import "ContactHomeViewController.h"
#import "DiscoveryViewController.h"
#import "MeViewController.h"


//@class WeiChatHomeViewController;
//@class ContactHomeViewController;
//@class DiscoveryViewController;
//@class MeViewController;

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 改变状态栏颜色
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"buttontoolbarBkg_dark"]];
    self.navigationController.navigationBar.barTintColor = kColorNavigationBar;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];       // 返回按钮那里的颜色
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];     // 改变标题字体
    
    /*
    BOOL isOneLevel = NO;
    if ([self isMemberOfClass:[WeiChatHomeViewController class]]) {
        isOneLevel = YES;
    }
    if ([self isMemberOfClass:[ContactHomeViewController class]]) {
        isOneLevel = YES;
    }
    if ([self isMemberOfClass:[DiscoveryViewController class]]) {
        isOneLevel = YES;
    }
    if ([self isMemberOfClass:[MeViewController class]]) {
        isOneLevel = YES;
    }
    self.hidesBottomBarWhenPushed = !isOneLevel;
    */
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



@end
