//
//  XHHookUtility.h
//  XHUserStatistics
//
//  Created by xihe on 12/08/2016.
//  Copyright (c) 2016 xihe. All rights reserved
//

#import <Foundation/Foundation.h>

@interface XHHookUtility : NSObject

+ (void)swizzlingInstanceMethodInClass:(Class)cls orginalMethod:(SEL)originalSelector swizzlingMethod:(SEL)swizzlingSelector;

+ (void)swizzlingClassMethodInClass:(Class)cls orginalMethod:(SEL)originalSelector swizzlingMethod:(SEL)swizzlingSelector;

@end
