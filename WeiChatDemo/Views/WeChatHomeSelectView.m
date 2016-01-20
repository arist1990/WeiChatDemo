//
//  ContentWeiXinPayView.m
//  LocalExpress
//
//  Created by ARIST on 15/11/20.
//  Copyright © 2015年 com.yogapay.tongchengkuaidi. All rights reserved.
//

#import "WeChatHomeSelectView.h"
#import "ImageUtil.h"
#import "WeiChatHomePopTableViewCell.h"

@implementation WeChatHomeSelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat width = 140;
        CGFloat height = 194;
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        self.imageView.image = [UIImage imageNamed:@"MoreFunctionFrame"];
        [self addSubview:self.imageView];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(6, 10, width-12, height-12) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.clipsToBounds = YES;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.layer.cornerRadius = 2.0f;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.scrollEnabled = NO;
        [self addSubview:self.tableView];
        
        self.frame = CGRectMake(ScreenWidth-width+2, 64, width, height);
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"WeiChatHomePopTableViewCell";
    
    WeiChatHomePopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[WeiChatHomePopTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor clearColor];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
        view.backgroundColor = kColorWeChatPopSelect;
        cell.selectedBackgroundView = view;
    }
    
    cell.index = indexPath.row;
    [cell setNeedsLayout];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.block) {
        self.block([NSNumber numberWithInteger:indexPath.row]);
    }
    
}

@end





