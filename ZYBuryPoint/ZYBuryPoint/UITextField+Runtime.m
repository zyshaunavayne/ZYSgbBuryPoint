//
//  UITextField+Runtime.m
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/11/19.
//

//
//  UITextField+Runtime.m
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/11/19.
//

#import "UITextField+Runtime.h"
#import <objc/runtime.h>
#import <Aspects/Aspects.h>

@implementation UITextField (Runtime)

+ (void)share
{
    static dispatch_once_t onceGcd;
    dispatch_once(&onceGcd, ^{
        SEL systemDelegateSel = @selector(setReturnKeyType:);
        SEL newDelegateSel = @selector(newSetReturnKeyType:);
        Method systemDelegateMTH = class_getInstanceMethod([self class], systemDelegateSel);
        Method newSystemDelegateMTH = class_getInstanceMethod([self class], newDelegateSel);
        BOOL delegateSuccess = class_addMethod(self, systemDelegateSel, method_getImplementation(newSystemDelegateMTH), method_getTypeEncoding(newSystemDelegateMTH));
        if (delegateSuccess) {
            class_replaceMethod(self, newDelegateSel, method_getImplementation(systemDelegateMTH), method_getTypeEncoding(systemDelegateMTH));
        }else{
            method_exchangeImplementations(systemDelegateMTH, newSystemDelegateMTH);
        }
    });
}

- (UIReturnKeyType)returnType
{
    return [objc_getAssociatedObject(self, @"returnType") integerValue] > 0 ? [objc_getAssociatedObject(self, @"returnType") integerValue] : UIReturnKeyDefault;
}

- (void)setReturnType:(UIReturnKeyType)returnType
{
    objc_setAssociatedObject(self, @"returnType", @(returnType), OBJC_ASSOCIATION_ASSIGN);
}

- (UIReturnKeyType)returnKeyType
{
    return self.returnType;
}

- (void)setReturnKeyType:(UIReturnKeyType)returnKeyType
{
    self.returnType = returnKeyType;
}

- (void)newSetReturnKeyType:(UIReturnKeyType)returnKeyType
{
    self.returnType = returnKeyType;
    if (returnKeyType == UIReturnKeySearch) {
        id superClass = self.delegate;
        [superClass aspect_hookSelector:@selector(textFieldShouldReturn:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
            for (id obj in aspectInfo.arguments) {
                if ([obj isEqual:self]) {
                    [ZYBuryPointRequest.shareBPR searchBuryPointAction:[ZYBuryPointProcess getCurrentVC] searchKey:self.text];
                    break;
                }
            }
        } error:nil];
    }
}

@end
