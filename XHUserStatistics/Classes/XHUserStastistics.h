//
//  XHUserStastistics.h
//  MyCard
//
//  Created by echo on 2016/11/24.
//  Copyright © 2016年 Insigma HengTian Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHUserStastistics : NSObject

@property (nonatomic, strong) NSDictionary *pageEvents;
@property (nonatomic, strong) NSDictionary *controlEvents;

@end

@interface XHPageEvent : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy)     NSString    *pageName;
@property (nonatomic, assign)   BOOL        appear;
@property (nonatomic, assign)   BOOL        disAppear;

@end

@interface XHActionEvent : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy)     NSString    *eventId;

@end
