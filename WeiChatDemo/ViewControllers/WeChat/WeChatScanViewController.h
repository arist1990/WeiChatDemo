//
//  WeChatScanViewController.h
//  WeiChatDemo
//
//  Created by ARIST on 16/1/14.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "BaseViewController.h"

@interface WeChatScanViewController : BaseViewController

@property (strong, nonatomic) IBOutlet UIView *viewRoot;

@property (weak, nonatomic) IBOutlet UIView *viewBottom;

@property (weak, nonatomic) IBOutlet UIButton *btnScanQR;
@property (weak, nonatomic) IBOutlet UIButton *btnScanBook;
@property (weak, nonatomic) IBOutlet UIButton *btnScanStreet;
@property (weak, nonatomic) IBOutlet UIButton *btnScanTranslate;

@property (weak, nonatomic) IBOutlet UIButton *btnMyCode;

@property (weak, nonatomic) IBOutlet UIView *viewCode;
@property (strong, nonatomic) UIImageView *ivScanCode;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constantCodeWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constantCodeHeight;


- (IBAction)btnActionQR:(id)sender;
- (IBAction)btnActionMyCode:(id)sender;


@end
