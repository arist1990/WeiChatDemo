//
//  WeChatShouFuKuanViewController.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/12.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "WeChatShouFuKuanViewController.h"

@interface WeChatShouFuKuanViewController ()

@end

@implementation WeChatShouFuKuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationBar.barTintColor = [UIColor groupTableViewBackgroundColor];
    
    self.labelShou.backgroundColor = kColorWeChatShouLabel;
    self.labelShou.clipsToBounds = YES;
    self.labelShou.layer.cornerRadius = self.labelShou.width/2;
    
    self.labelFu.backgroundColor = kColorWeChatFuLabel;
    self.labelFu.clipsToBounds = YES;
    self.labelFu.layer.cornerRadius = self.labelFu.width/2;
    
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = 4.0f;
    style.alignment = NSTextAlignmentCenter;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"收付款\n微信安全支付"];
    [attr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]} range:[attr.string rangeOfString:@"微信安全支付"]];
    [attr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attr.length)];
    self.labelTitle.attributedText = attr;
}


- (IBAction)btnActionShou:(id)sender {
    
}

- (IBAction)btnActionFu:(id)sender {

}

- (IBAction)btnActionCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
