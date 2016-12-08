//
//  XHUserStatistics.m
//  MyCard
//
//  Created by echo on 2016/11/24.
//  Copyright © 2016年 Insigma HengTian Software Ltd. All rights reserved.
//

#import "XHUserStastisticsManager.h"

static XHUserStastisticsManager *instance;

@interface XHUserStastisticsManager ()

@property (nonatomic, strong) NSDictionary *pageEvents;
@property (nonatomic, strong) NSDictionary *actionEvents;

@end

@implementation XHUserStastisticsManager

+ (instancetype)manager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[XHUserStastisticsManager alloc] init];
        [instance actionEvents];
        [instance pageEvents];
    });
    return instance;
}

#pragma mark - Public method

- (void)sendPageAppearEvent:(NSString *)pageEventName {
    XHPageEvent *pageEvent = [self getPageEvent:pageEventName];
    if (pageEvent && pageEvent.appear && self.appearPageEventBlock) {
        self.appearPageEventBlock(pageEvent);
    }
}

- (void)sendPageDisAppearEvent:(NSString *)pageEventName {
    XHPageEvent *pageEvent = [self getPageEvent:pageEventName];
    if (pageEvent && pageEvent.disAppear && self.disappearPageEventBlock) {
        self.disappearPageEventBlock(pageEvent);
    }
}

- (void)sendActionEvent:(NSString *)actionName andTargetName:(NSString *)targetName
{
    NSDictionary *targetsDictionary = self.actionEvents[actionName];
    NSDictionary *actionEventDictionary = targetsDictionary[targetName];
    
    if (actionEventDictionary) {
        XHActionEvent *actionEvent = [[XHActionEvent alloc] initWithDictionary:actionEventDictionary];
        if (actionEvent) {
            if (self.actionEventBlock) {
                self.actionEventBlock(actionEvent);
            }
        }
    }
}

#pragma mark - Private method

- (XHPageEvent *)getPageEvent:(NSString *)pageEventName
{
    NSDictionary *pageEventDictionary = self.pageEvents[pageEventName];
    
    if (pageEventDictionary) {
        XHPageEvent *pageEvent = [[XHPageEvent alloc] initWithDictionary:pageEventDictionary];
        if (pageEvent) {
            return pageEvent;
        }
    }
    
    return nil;
}

#pragma mark - getters

- (NSDictionary *)pageEvents {
    if (!_pageEvents) {
        NSString *path = [[NSBundle mainBundle] pathForResource:XHUserStatisticsPlistName ofType:@"plist"];
        NSDictionary *userStatistics = [NSDictionary dictionaryWithContentsOfFile:path];
        
        _pageEvents = userStatistics[XHUserStatisticsPageEventKey];
    }
    return _pageEvents;
}

- (NSDictionary *)actionEvents {
    if (!_actionEvents) {
        NSString *path = [[NSBundle mainBundle] pathForResource:XHUserStatisticsPlistName ofType:@"plist"];
        NSDictionary *userStatistics = [NSDictionary dictionaryWithContentsOfFile:path];
        
        _actionEvents = userStatistics[XHUserStatisticsActionEventKey];
    }
    return _actionEvents;
}

@end
