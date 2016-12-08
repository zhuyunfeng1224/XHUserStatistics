//
//  XHHookUtility.h
//  ShouChouJin
//
//  Created by xihe on 16/5/19.
//  Copyright © 2016年 ouer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHHookUtility : NSObject

+ (void)swizzlingInstanceMethodInClass:(Class)cls orginalMethod:(SEL)originalSelector swizzlingMethod:(SEL)swizzlingSelector;

+ (void)swizzlingClassMethodInClass:(Class)cls orginalMethod:(SEL)originalSelector swizzlingMethod:(SEL)swizzlingSelector;

@end
