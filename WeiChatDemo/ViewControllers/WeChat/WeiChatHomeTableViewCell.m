//
//  WeiChatHomeTableViewCell.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/11.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "WeiChatHomeTableViewCell.h"

@implementation WeiChatHomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

//    NSLog(@"%s", __func__);
    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_data) {
        
        if (self.viewGesture == nil) {
            [self initViews];
        }
        
        self.ivImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [_data objectForKey:@"image"]]];
        
        self.labelText.text = [_data objectForKey:@"name"];
        self.labelDetail.text = [_data objectForKey:@"summary"];
        self.labelTime.text = [self getTimeStr:[NSString stringWithFormat:@"%@", [_data objectForKey:@"time"]]];
        
        NSInteger unreadCount = [[NSString stringWithFormat:@"%@", [_data objectForKey:@"unreadcount"]] integerValue];
        self.viewDot.hidden = unreadCount <= 0;
    }
}

- (void)initViews{
    self.viewGesture = [[WeChatHomeTableCellGestureView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [self.contentView addSubview:self.viewGesture];
    
    self.ivImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 44, 44)];
    self.ivImage.clipsToBounds = YES;
    self.ivImage.layer.cornerRadius = 5;
    [self.viewGesture addSubview:self.ivImage];
    
//    self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
//    [self.viewGesture addGestureRecognizer:self.pan];
    
//    self.viewSep = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-.5, self.bounds.size.width, .5)];
//    self.viewSep.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    [self.contentView addSubview:self.viewSep];
    
    self.labelText = [[UILabel alloc] initWithFrame:CGRectMake(64, 10, self.bounds.size.width-64-60, 20)];
    self.labelText.font = [UIFont systemFontOfSize:14.0f];
    self.labelText.textColor = [UIColor blackColor];
    [self.viewGesture addSubview:self.labelText];
    
    self.labelDetail = [[UILabel alloc] initWithFrame:CGRectMake(64, self.bounds.size.height-10-20, self.bounds.size.width-64-10, 20)];
    self.labelDetail.font = [UIFont systemFontOfSize:13.0f];
    self.labelDetail.textColor = [UIColor darkGrayColor];
    [self.viewGesture addSubview:self.labelDetail];
    
    self.labelTime = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width-10-50, 5, 50, 20)];
    self.labelTime.font = [UIFont systemFontOfSize:11.0f];
    self.labelTime.textColor = [UIColor lightGrayColor];
    self.labelTime.textAlignment = NSTextAlignmentRight;
    [self.viewGesture addSubview:self.labelTime];
    
    self.viewDot = [[UILabel alloc] initWithFrame:CGRectMake(self.ivImage.right-8, self.ivImage.top-2, 10, 10)];
    self.viewDot.backgroundColor = [UIColor redColor];
    self.viewDot.clipsToBounds = YES;
    self.viewDot.layer.cornerRadius = 5;
    self.viewDot.hidden = YES;
    [self.viewGesture addSubview:self.viewDot];
    
    
}

- (void)panAction:(UIPanGestureRecognizer *)pan{
    NSLog(@"%@", pan);
    CGPoint point = [pan translationInView:self.contentView];
    NSLog(@"%f,%f",point.x,point.y);
    pan.view.center = CGPointMake(pan.view.center.x + point.x, self.contentView.center.y);
    [pan setTranslation:CGPointMake(0, 0) inView:self.contentView];
}


- (NSString *)getTimeStr:(NSString *)time{
    NSDateFormatter *formate = [NSDateFormatter new];
    [formate setDateFormat:@"yyyy年MM月dd日HH:mm:ss"];
    
    NSDate *date = [formate dateFromString:time];
    NSDate *currentDate = [NSDate date];
    
    [formate setDateFormat:@"yyyy年MM月dd日"];
    NSString *timeToday = [formate stringFromDate:currentDate];
    NSDate *dateTodayStart = [formate dateFromString:timeToday];    // 今天的开始时间戳
    
    NSDate *dateYesterDayStart = [dateTodayStart dateByAddingTimeInterval:-60*60*24];   // 昨天开始的时间戳
    
    NSDate *dateOneWeakStart = [dateTodayStart dateByAddingTimeInterval:-60*60*24*7];   // 最近一周开始的时间戳
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSString *result = @"";
    
    if (date.timeIntervalSince1970 < dateOneWeakStart.timeIntervalSince1970) {
        // 表示是一周之前，直接显示日期如 16/01/01
        [formate setDateFormat:@"yy/MM/dd"];
        result = [formate stringFromDate:date];
    } else if (date.timeIntervalSince1970 < dateYesterDayStart.timeIntervalSince1970) {
        // 两天 到 一周之内，显示星期几
        NSArray *array = @[@"星期六", @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", @"星期天"];
//        NSInteger dayOfWeek = [cal component:NSCalendarUnitWeekday fromDate:date];    // 从iOS8开始使用
        
        NSDateComponents *comps = [cal components:NSCalendarUnitWeekday fromDate:date];
        NSInteger dayOfWeek = comps.weekday;
        
        if (dayOfWeek >= 0 && dayOfWeek < array.count) {
            result = array[dayOfWeek];
        } else
            result = array[0];
        
//        NSLog(@"date:%@ - dayOfWeek:%@", date, @(dayOfWeek));
    } else if (date.timeIntervalSince1970 < dateTodayStart.timeIntervalSince1970) {
        result = @"昨天";
    } else {
        // 是今天，显示 小时+分钟，如：12:34
        [formate setDateFormat:@"HH:mm"];
        result = [formate stringFromDate:date];
    }
    return result;
}


- (void)configView:(NSDictionary *)dic {
    if (dic) {
        _data = dic;
        [self setNeedsLayout];
    }
}

@end
