//
//  XHUserStastistics.h
//  XHUserStatistics
//
//  Created by xihe on 12/08/2016.
//  Copyright (c) 2016 xihe. All rights reserved
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
