//
//  WeChatUserInfoViewController.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/13.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "WeChatUserInfoViewController.h"
#import "ImageUtil.h"

@interface WeChatUserInfoViewController ()

@end

@implementation WeChatUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的二维码";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_more"] style:UIBarButtonItemStyleDone target:self action:@selector(rightEvent)];
    self.navigationItem.rightBarButtonItem = item;
    
    if (self.isPrensented) {
        self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.2];
    }
    
    self.viewContent.clipsToBounds = YES;
    self.viewContent.layer.cornerRadius = 5;
    
    self.ivImagePhoto.clipsToBounds = YES;
    self.ivImagePhoto.layer.cornerRadius = 5;
    
    self.ivImageQR.image = [ImageUtil createNonInterpolatedUIImageFormCIImage:[ImageUtil createQRForString:@"http://www.baidu.com"] withSize:self.ivImageQR.width*[UIScreen mainScreen].scale];
    
}


- (void)rightEvent{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.isPrensented) {
        UITouch *touch = [touches allObjects][0];
        CGPoint point = [touch locationInView:self.view];
        if (!CGRectContainsPoint(self.viewContent.frame, point)) {
            [self dismissViewControllerAnimated:NO completion:nil];
        }
    }
    
}



@end
