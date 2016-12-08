//
//  XHUserStatistics.h
//  XHUserStatistics
//
//  Created by xihe on 12/08/2016.
//  Copyright (c) 2016 xihe. All rights reserved
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
