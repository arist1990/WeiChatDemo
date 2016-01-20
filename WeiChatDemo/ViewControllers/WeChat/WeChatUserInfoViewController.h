//
//  WeChatUserInfoViewController.h
//  WeiChatDemo
//
//  Created by ARIST on 16/1/13.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeChatUserInfoViewController : BaseViewController

@property(nonatomic) BOOL isPrensented; // 是否是模态弹出

@property (weak, nonatomic) IBOutlet UIView *viewContent;

@property (weak, nonatomic) IBOutlet UIImageView *ivImageQR;
@property (weak, nonatomic) IBOutlet UIImageView *ivImagePhoto;


@end
