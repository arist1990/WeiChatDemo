//
//  StartUpViewController.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/11.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "StartUpViewController.h"
#import "TabBarViewController.h"

@interface StartUpViewController ()

@end

@implementation StartUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(timeAction) withObject:nil afterDelay:1];

}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)timeAction{
    NSLog(@"%s", __func__);
    
    [self performSegueWithIdentifier:@"StartupToHome" sender:nil];
    
}


@end
