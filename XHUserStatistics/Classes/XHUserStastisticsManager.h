//
//  XHUserStatistics.h
//  MyCard
//
//  Created by echo on 2016/11/24.
//  Copyright © 2016年 Insigma HengTian Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XHUserStastistics.h"

#define XHUserStatisticsPlistName @"UserStatistics"
#define XHUserStatisticsPageEventKey @"pageEvents"
#define XHUserStatisticsActionEventKey @"actionEvents"

// 页面访问事件Block
typedef void(^XHUserStatisticsPageEvent)(XHPageEvent *pageEvent);

// 自定义事件
typedef void(^XHUserStatisticsActionEvent)(XHActionEvent *actionEvent);

@interface XHUserStastisticsManager : NSObject

@property (nonatomic, strong, readonly) NSDictionary *pageEvents;
@property (nonatomic, strong, readonly) NSDictionary *actionEvents;

@property (nonatomic, strong) XHUserStatisticsPageEvent appearPageEventBlock;
@property (nonatomic, strong) XHUserStatisticsPageEvent disappearPageEventBlock;
@property (nonatomic, strong) XHUserStatisticsActionEvent actionEventBlock;

+ (instancetype)manager;

- (void)sendPageAppearEvent:(NSString *)pageEventName;
- (void)sendPageDisAppearEvent:(NSString *)pageEventName;
- (void)sendActionEvent:(NSString *)actionName andTargetName:(NSString *)targetName;

@end
