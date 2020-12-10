//
//  UIButton+BPRuntime.m
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/12/10.
//

#import "UIButton+BPRuntime.h"
#import <objc/runtime.h>

@implementation UIButton (BPRuntime)

- (NSString *)reportingEvent
{
    return objc_getAssociatedObject(self, @"reportingEvent");;
}

- (void)setReportingEvent:(NSString *)reportingEvent
{
    objc_setAssociatedObject(self, @"reportingEvent", reportingEvent, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)reportingTask
{
    return objc_getAssociatedObject(self, @"reportingTask");
}

- (void)setReportingTask:(NSString *)reportingTask
{
    objc_setAssociatedObject(self, @"reportingTask", reportingTask, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)reportingUrl
{
    return objc_getAssociatedObject(self, @"reportingUrl");
}

- (void)setReportingUrl:(NSString *)reportingUrl
{
    objc_setAssociatedObject(self, @"reportingUrl", reportingUrl, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (void)share
{
    static dispatch_once_t onceGcd;
    dispatch_once(&onceGcd, ^{
        Method method = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
        Method newMthod = class_getInstanceMethod(self, @selector(newSendAction:to:forEvent:));
        method_exchangeImplementations(method, newMthod);
    });
}

- (void)newSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    NSLog(@"你点到我了");
    if (self.reportingEvent && self.reportingTask && self.reportingUrl) {
        /*
         只有设置了上报类型、上报url、上报Task的点击事件才会被记录
         */
        [ZYBuryPointRequest.shareBPR beginTaskBuryPointAction:self];
    }
    [self newSendAction:action to:target forEvent:event];
}

@end
