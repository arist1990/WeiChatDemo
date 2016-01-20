//
//  FirstViewController.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/11.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "WeiChatHomeViewController.h"
#import "WeiChatHomeTableViewCell.h"
#import "WeChatUserInfoViewController.h"
#import "ImageUtil.h"
#import "WeChatPCLoginViewController.h"

@interface WeiChatHomeViewController ()

@end

@implementation WeiChatHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.data = [NSMutableArray new];
    
    [self refreshData];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 10, 0, 0);
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:insets];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:insets];
    }
    
    _popWindowView = [[PopWindowView alloc] init];
    _wechatHomeSelectView = [[WeChatHomeSelectView alloc] init];
    _wechatHomeSelectView.block = ^(NSNumber *number){
        [_popWindowView hide];
        NSInteger num = [number integerValue];
        if (num == 3) {
            [self performSegueWithIdentifier:@"PresentShouFuKuan" sender:nil];
        } else if (num == 1) {
            [self performSegueWithIdentifier:@"WeChatHomePushToAddFriend" sender:nil];
        } else if (num == 2) {
            [self performSegueWithIdentifier:@"WeChatHomeToScan" sender:nil];
        }
    };
    
}

- (void)timeAction{
    UIImage *image = [ImageUtil caputureView:self.view];
    image = [ImageUtil getCIGaussianBlurImageWithRadius:40 image:image];
    WeChatPCLoginViewController *ctrl = [[WeChatPCLoginViewController alloc] init];
    ctrl.view.backgroundColor = [UIColor whiteColor];
    ctrl.ivImage.image = image;
    [self presentViewController:ctrl animated:YES completion:nil];
}

- (void)refreshData{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"WeiChatListDataSource" ofType:@"plist"]];
    
    [self.data removeAllObjects];
    for (NSDictionary *dic in array) {
        [self.data addObject:[NSMutableDictionary dictionaryWithDictionary:dic]];
    }
    
    [self.tableView reloadData];
}


- (IBAction)pushAction:(id)sender {
    [_popWindowView showWithContentView:_wechatHomeSelectView];
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"WeiChatHomeTableViewCell";
    WeiChatHomeTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[WeiChatHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
    }
    [cell configView:self.data[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.data removeObjectAtIndex:indexPath.row];
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    [self.tableView endUpdates];
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger unreadCount = [[NSString stringWithFormat:@"%@", [self.data[indexPath.row] objectForKey:@"unreadcount"]] integerValue];
    
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:(unreadCount == 0 ? @"标为未读" : @"标为已读") handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSInteger unreadCount = [[NSString stringWithFormat:@"%@", [self.data[indexPath.row] objectForKey:@"unreadcount"]] integerValue];
        unreadCount = unreadCount == 0 ? 1 : 0;
        [self.data[indexPath.row] setValue:[NSString stringWithFormat:@"%@", @(unreadCount)] forKey:@"unreadcount"];
        
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        
    }];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.data removeObjectAtIndex:indexPath.row];
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        [self.tableView endUpdates];
        
    }];
    
    return @[action2, action1];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"WeChatHomePushToAddFriend"]) {
        segue.destinationViewController.hidesBottomBarWhenPushed = YES;
    }
}

@end
