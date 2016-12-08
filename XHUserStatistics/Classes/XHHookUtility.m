//
//  XHHookUtility.m
//  XHUserStatistics
//
//  Created by xihe on 12/08/2016.
//  Copyright (c) 2016 xihe. All rights reserved
//

#import "XHHookUtility.h"
#import <objc/runtime.h>

@implementation XHHookUtility

+ (void)swizzlingInstanceMethodInClass:(Class)cls orginalMethod:(SEL)originalSelector swizzlingMethod:(SEL)swizzlingSelector
{
    //  获取原来和要替换的方法
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzlingMethod = class_getInstanceMethod(cls, swizzlingSelector);
    
    //  判断orginalMethod是否存在，不存在则添加
    BOOL didAddMethod = class_addMethod(cls, originalSelector, class_getMethodImplementation(cls, swizzlingSelector), method_getTypeEncoding(swizzlingMethod));
    
    //  添加成功，替换实现，否则，交换两个方法
    if (didAddMethod) {
        class_replaceMethod(cls, swizzlingSelector, class_getMethodImplementation(cls, originalSelector), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzlingMethod);
    }
}

+ (void)swizzlingClassMethodInClass:(Class)cls orginalMethod:(SEL)originalSelector swizzlingMethod:(SEL)swizzlingSelector
{
    //  获取原来和要替换的方法
    Method originalMethod = class_getClassMethod(cls, originalSelector);
    Method swizzlingMethod = class_getClassMethod(cls, swizzlingSelector);
    
    //  添加自定义方法，实现为swizzlingMethod
    BOOL didAddMethod = class_addMethod(cls, originalSelector, class_getMethodImplementation(cls, swizzlingSelector), method_getTypeEncoding(swizzlingMethod));
    
    //  如果成功则替换
    if (didAddMethod) {
        class_replaceMethod(cls, swizzlingSelector, class_getMethodImplementation(cls, originalSelector), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzlingMethod);
    }
}

@end
