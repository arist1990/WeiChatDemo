//
//  WeChatScanViewController.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/14.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "WeChatScanViewController.h"
#import "WeChatUserInfoViewController.h"

@interface WeChatScanViewController ()

@end

@implementation WeChatScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.btnMyCode setTitleColor:kColorStyle forState:UIControlStateNormal];
    
    self.viewBottom.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.3];
    
    for (UIButton *btn in self.viewBottom.subviews) {
        if (btn.tag >= 101 && btn.tag <= 104) {
            [btn setTitleColor:kColorStyle forState:UIControlStateSelected];
            [btn setTitleColor:kColorStyle forState:UIControlStateHighlighted];
        }
    }
    for (UIView *view in self.viewRoot.subviews) {
        view.alpha = 0;
        if (view.tag <= 10004 && view.tag >= 10001) {
            view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.2];
        }
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:.3 animations:^{
            for (UIView *view in self.viewRoot.subviews) {
                view.alpha = 1;
            }
        }completion:^(BOOL finished) {
            [self animate];
        }];
    });
    
    self.ivScanCode = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, self.viewCode.width-40, 12)];
    self.ivScanCode.contentMode = UIViewContentModeScaleToFill;
    self.ivScanCode.image = [UIImage imageNamed:@"ff_QRCodeScanLine"];
    [self.viewCode addSubview:self.ivScanCode];
    
}

- (IBAction)btnActionQR:(id)sender {
    UIButton *btn = (UIButton *)sender;
    self.btnScanQR.selected = btn.tag == self.btnScanQR.tag;
    self.btnScanBook.selected = btn.tag == self.btnScanBook.tag;
    self.btnScanStreet.selected = btn.tag == self.btnScanStreet.tag;
    self.btnScanTranslate.selected = btn.tag == self.btnScanTranslate.tag;
    
    [UIView animateWithDuration:1 animations:^{
        if (btn.tag == 101) {
            _constantCodeWidth.constant = 200;
            _constantCodeHeight.constant = 200;
        } else if (btn.tag == 102) {
            _constantCodeWidth.constant = 260;
            _constantCodeHeight.constant = 300;
        } else if (btn.tag == 103) {
            _constantCodeWidth.constant = 260;
            _constantCodeHeight.constant = 300;
        } else if (btn.tag == 104) {
            _constantCodeWidth.constant = 260;
            _constantCodeHeight.constant = 40;
        }
        [self.viewRoot setNeedsUpdateConstraints];
        self.ivScanCode = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, _constantCodeWidth.constant-40, 12)];
        [self.ivScanCode.layer removeAllAnimations];
    } completion:^(BOOL finished) {
        self.ivScanCode.top = 0;
        if (self.viewCode.height > 40) {
            [self animate];
        }
    }];
    
}

- (void)animate{
    CGFloat spcaePerSec = 80;
    CGFloat time = self.viewCode.height / spcaePerSec;
    
    [UIView animateWithDuration:time animations:^{
        self.ivScanCode.top = self.viewCode.height - self.ivScanCode.height;
    } completion:^(BOOL finished) {
        self.ivScanCode.top = 0;
        [self animate];
    }];
}

- (IBAction)btnActionMyCode:(id)sender {
    WeChatUserInfoViewController *userInfo = [[WeChatUserInfoViewController alloc] init];
    [self.navigationController pushViewController:userInfo animated:YES];
}

@end
