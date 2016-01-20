//
//  WeChatAddFriendViewController.h
//  WeiChatDemo
//
//  Created by ARIST on 16/1/13.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "BaseViewController.h"

@interface WeChatAddFriendViewController : BaseViewController


@end


@interface WeChatAddFriendTableViewController : UITableViewController

@property (nonatomic, strong) UIView *viewHeader;

@property (weak, nonatomic) IBOutlet UITextField *tfInput;

- (IBAction)btnActionQRCode:(id)sender;

@end