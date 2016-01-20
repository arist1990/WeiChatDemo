//
//  SecondViewController.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/11.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.hidesBottomBarWhenPushed = YES;
    
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStyleDone target:self action:@selector(pushAction)];
//    self.navigationItem.rightBarButtonItem = item;
    
}

- (void)pushAction{
    [self.navigationController pushViewController:[SecondViewController new] animated:YES];
}

@end
