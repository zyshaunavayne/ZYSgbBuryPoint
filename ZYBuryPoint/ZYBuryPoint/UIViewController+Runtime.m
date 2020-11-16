//
//  UIViewController+Runtime.m
//  SGBProject
//
//  Created by 张宇 on 2020/10/28.
//  Copyright © 2020 dtx. All rights reserved.
//

#import "UIViewController+Runtime.h"
#import <objc/runtime.h>

@implementation UIViewController (Runtime)

+ (void)share
{
    static dispatch_once_t onceGcd;
    dispatch_once(&onceGcd, ^{
        
        //替换viewWillAppear
        SEL systemSel1 = @selector(viewWillAppear:);
        SEL newSel1 = @selector(newViewWillAppear:);
        Method systemMethod1 = class_getInstanceMethod([self class], systemSel1);
        Method newMethod1 = class_getInstanceMethod([self class], newSel1);
        BOOL success1 = class_addMethod(self, systemSel1, method_getImplementation(newMethod1), method_getTypeEncoding(newMethod1));
        if (success1) {
            class_replaceMethod(self, newSel1, method_getImplementation(systemMethod1), method_getTypeEncoding(systemMethod1));
        }else{
            method_exchangeImplementations(systemMethod1, newMethod1);
        }
        
        //替换viewWillDisAppear
        SEL systemSel2 = @selector(viewWillDisappear:);
        SEL newSel2 = @selector(newViewWillDisAppear:);
        Method systemMethod2 = class_getInstanceMethod([self class], systemSel2);
        Method newMethod2 = class_getInstanceMethod([self class], newSel2);
        BOOL success2 = class_addMethod(self, systemSel2, method_getImplementation(newMethod2), method_getTypeEncoding(newMethod2));
        if (success2) {
            class_replaceMethod(self, newSel2, method_getImplementation(systemMethod2), method_getTypeEncoding(systemMethod2));
        }else{
            method_exchangeImplementations(systemMethod2, newMethod2);
        }
        
    });
}

- (void)newViewWillAppear:(BOOL)animated
{
    if ([self isBuryPointVC]) {
        [ZYBuryPointRequest.shareBPR beginBuryPointAction:self];
    }
}

- (void)newViewWillDisAppear:(BOOL)animated
{
    if ([self isBuryPointVC]) {
        [ZYBuryPointRequest.shareBPR endBuryPointAction:self];
    }
}

/// 移除不需要埋点页面
- (BOOL)isBuryPointVC
{
    /*
     移除部分无用相关页面埋点操作
 
     UITextfile/UITextView相关
     <UICompatibilityInputViewController,
     UIPredictionViewController,
     UISystemInputAssistantViewController,
     UIInputWindowController,
     UIEditingOverlayViewController>
     
     UIAlertController,
     RootHomeViewController,
     BaseNavClassViewController,
     
    */
    
    if ([self isKindOfClass:[NSClassFromString(@"UICompatibilityInputViewController") class]] || [self isKindOfClass:[NSClassFromString(@"UIPredictionViewController") class]] || [self isKindOfClass:[NSClassFromString(@"UISystemInputAssistantViewController") class]] || [self isKindOfClass:[NSClassFromString(@"UIInputWindowController") class]] || [self isKindOfClass:[NSClassFromString(@"UIEditingOverlayViewController") class]] || [NSClassFromString(@"UIAlertController") class] || [self isKindOfClass:[NSClassFromString(@"RootHomeViewController") class]] || [self isKindOfClass:[NSClassFromString(@"BaseNavClassViewController") class]]) {
        return NO;
    }
    return YES;
}

@end
