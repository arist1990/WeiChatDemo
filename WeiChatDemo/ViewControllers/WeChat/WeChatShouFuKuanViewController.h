//
//  WeChatShouFuKuanViewController.h
//  WeiChatDemo
//
//  Created by ARIST on 16/1/12.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeChatShouFuKuanViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelShou;
@property (weak, nonatomic) IBOutlet UILabel *labelFu;

@property (weak, nonatomic) IBOutlet UIButton *btnShou;
@property (weak, nonatomic) IBOutlet UIButton *btnFu;

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

- (IBAction)btnActionShou:(id)sender;
- (IBAction)btnActionFu:(id)sender;

- (IBAction)btnActionCancel:(id)sender;


@end
