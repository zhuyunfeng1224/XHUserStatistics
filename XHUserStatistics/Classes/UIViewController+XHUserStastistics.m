//
//  UIViewController+XHUserStastistics.m
//  XHUserStatistics
//
//  Created by xihe on 12/08/2016.
//  Copyright (c) 2016 xihe. All rights reserved
//

#import "UIViewController+XHUserStastistics.h"
#import "XHHookUtility.h"
#import "XHUserStastisticsManager.h"
#import <objc/runtime.h>
#import <libkern/OSAtomic.h>

typedef id   (*_IMP)  (id,SEL,...);
typedef void (*_VIMP) (id,SEL,...);

typedef void(^v_block0)(id self);
typedef void(^v_block1)(id self, id arg0);
typedef void(^v_block2)(id self, id arg0, id arg1);
typedef void(^v_block3)(id self, id arg0, id arg1, id arg2);

typedef id(^block0)(id self);
typedef id(^block1)(id self, id arg0);
typedef id(^block2)(id self, id arg0, id arg1);
typedef id(^block3)(id self, id arg0, id arg1, id arg2);


@implementation UIViewController (XHUserStastistics)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [XHHookUtility swizzlingInstanceMethodInClass:[self class] orginalMethod:@selector(viewWillAppear:) swizzlingMethod:@selector(xh_swizzlingViewWillAppear:)];
        [XHHookUtility swizzlingInstanceMethodInClass:[self class] orginalMethod:@selector(viewWillDisappear:) swizzlingMethod:@selector(xh_swizzlingViewWillDisAppear:)];
    });
}


+ (void)initialize {
    [super initialize];
    NSArray *allKeys = [[XHUserStastisticsManager manager].actionEvents allKeys];
    
    for (NSString *action in allKeys) {
        const char *str = [action UTF8String];
        __block SEL sel = sel_registerName(str);
        
        if (class_respondsToSelector([self class], sel)) {
            // 新加要替换方法
            Method method = class_getInstanceMethod([self class], sel);
            // 获取返回值类型
            char returnType[512] = {};
            method_getReturnType(method, returnType, 512);
            NSString *returnTypeString = [NSString stringWithUTF8String:returnType];
            NSString *targetName = NSStringFromClass(self);
            // 加锁
            __block OSSpinLock lock = OS_SPINLOCK_INIT;
            // 获取参数个数
            int argumentsCount = method_getNumberOfArguments(method) - 2;
            BOOL hasReturnValue = ![returnTypeString isEqual: @"v"];
            if (argumentsCount == 0) {
                
                if (!hasReturnValue) {
                    _VIMP originalImp = (_VIMP)method_getImplementation(method);
                    v_block0 block = ^void(__unsafe_unretained id target) {
                        [[XHUserStastisticsManager manager] sendActionEvent:action andTargetName:targetName];
                        originalImp(target, sel);
                    };
                    IMP newImp = imp_implementationWithBlock([block copy]);
                    OSSpinLockLock(&lock);
                    method_setImplementation(method, newImp);
                    OSSpinLockUnlock(&lock);
                }
                else {
                    _IMP originalImp = (_IMP)method_getImplementation(method);
                    block0 block = ^id(__unsafe_unretained id target) {
                        [[XHUserStastisticsManager manager] sendActionEvent:action andTargetName:targetName];
                        return originalImp(target, sel);
                    };
                    IMP newImp = imp_implementationWithBlock([block copy]);
                    OSSpinLockLock(&lock);
                    method_setImplementation(method, newImp);
                    OSSpinLockUnlock(&lock);
                }
            }
            else if (argumentsCount == 1) {
                if (!hasReturnValue) {
                    _VIMP originalImp = (_VIMP)method_getImplementation(method);
                    v_block1 block = ^(__unsafe_unretained id  target, __unsafe_unretained id arg0) {
                        [[XHUserStastisticsManager manager] sendActionEvent:action andTargetName:targetName];
                        originalImp(target, sel, arg0);
                    };
                    IMP newImp = imp_implementationWithBlock([block copy]);
                    OSSpinLockLock(&lock);
                    method_setImplementation(method, newImp);
                    OSSpinLockUnlock(&lock);
                }
                else {
                    _IMP originalImp = (_IMP)method_getImplementation(method);
                    block1 block = ^id(__unsafe_unretained id target, __unsafe_unretained id arg0) {
                        [[XHUserStastisticsManager manager] sendActionEvent:action andTargetName:targetName];
                        return originalImp(target, sel, arg0);
                    };
                    IMP newImp = imp_implementationWithBlock([block copy]);
                    OSSpinLockLock(&lock);
                    method_setImplementation(method, newImp);
                    OSSpinLockUnlock(&lock);
                }
            }
            else if (argumentsCount == 2) {
                
                if (!hasReturnValue) {
                    __block _VIMP originalImp = (_VIMP)method_getImplementation(method);
                    v_block2 block = ^(__unsafe_unretained id target, __unsafe_unretained id arg0, __unsafe_unretained id arg1) {
                        [[XHUserStastisticsManager manager] sendActionEvent:action andTargetName:targetName];
                        originalImp(target, sel, arg0, arg1);
                    };
                    IMP newImp = imp_implementationWithBlock([block copy]);
                    OSSpinLockLock(&lock);
                    method_setImplementation(method, newImp);
                    OSSpinLockUnlock(&lock);
                }
                else {
                    __block _IMP originalImp = (_IMP)method_getImplementation(method);
                    block2 block = ^id(__unsafe_unretained id target, __unsafe_unretained id arg0, __unsafe_unretained id arg1) {
                        [[XHUserStastisticsManager manager] sendActionEvent:action andTargetName:targetName];
                        return originalImp(target, sel, arg0, arg1);;
                    };
                    IMP newImp = imp_implementationWithBlock([block copy]);
                    OSSpinLockLock(&lock);
                    method_setImplementation(method, newImp);
                    OSSpinLockUnlock(&lock);
                }
            }
            else if (argumentsCount == 3) {
                
                if (!hasReturnValue) {
                    __block _VIMP originalImp = (_VIMP)method_getImplementation(method);
                    v_block3 block = ^(__unsafe_unretained id target, __unsafe_unretained id arg0, __unsafe_unretained id arg1, __unsafe_unretained id arg2) {
                        [[XHUserStastisticsManager manager] sendActionEvent:action andTargetName:targetName];
                        originalImp(target, sel, arg0, arg1, arg2);
                    };
                    IMP newImp = imp_implementationWithBlock([block copy]);
                    OSSpinLockLock(&lock);
                    method_setImplementation(method, newImp);
                    OSSpinLockUnlock(&lock);
                }
                else {
                    __block _IMP originalImp = (_IMP)method_getImplementation(method);
                    block3 block = ^id(__unsafe_unretained id target, __unsafe_unretained id arg0, __unsafe_unretained id arg1, __unsafe_unretained id arg2) {
                        [[XHUserStastisticsManager manager] sendActionEvent:action andTargetName:targetName];
                        return originalImp(target, sel, arg0, arg1, arg2);;
                    };
                    IMP newImp = imp_implementationWithBlock([block copy]);
                    OSSpinLockLock(&lock);
                    method_setImplementation(method, newImp);
                    OSSpinLockUnlock(&lock);
                }
            }
        }
    }
}

- (void)xh_swizzlingViewWillAppear:(BOOL)animated
{
    [self xh_swizzlingViewWillAppear:animated];
    [[XHUserStastisticsManager manager] sendPageAppearEvent:NSStringFromClass([self class])];
}

- (void)xh_swizzlingViewWillDisAppear:(BOOL)animated
{
    [self xh_swizzlingViewWillDisAppear:animated];
    [[XHUserStastisticsManager manager] sendPageDisAppearEvent:NSStringFromClass([self class])];
}

@end
