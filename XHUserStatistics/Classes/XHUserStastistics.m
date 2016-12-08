//
//  XHUserStastistics.m
//  MyCard
//
//  Created by echo on 2016/11/24.
//  Copyright © 2016年 Insigma HengTian Software Ltd. All rights reserved.
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
