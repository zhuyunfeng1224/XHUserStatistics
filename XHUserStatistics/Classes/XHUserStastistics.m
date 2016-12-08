//
//  XHUserStastistics.m
//  XHUserStatistics
//
//  Created by xihe on 12/08/2016.
//  Copyright (c) 2016 xihe. All rights reserved
//

#import "XHUserStastistics.h"

@implementation XHUserStastistics

@end

@implementation XHPageEvent

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.pageName = dictionary[@"pageName"];
        self.appear = [dictionary[@"appear"] boolValue];
        self.disAppear = [dictionary[@"disAppear"] boolValue];
    }
    return self;
}

@end

@implementation XHActionEvent

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.eventId = dictionary[@"eventId"];
    }
    return self;
}


@end
