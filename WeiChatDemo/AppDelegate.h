//
//  AppDelegate.h
//  WeiChatDemo
//
//  Created by ARIST on 16/1/11.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// git提交测试
@property (strong, nonatomic) UIViewController *testCtrl;

// 新增一个好玩的功能
@property (strong, nonatomic) UIViewController *newCtrl;

// 新增的好玩的功能测试通过之后合并到主分支
@property (strong, nonatomic) UIViewController *newDoneCtrl;

@end

