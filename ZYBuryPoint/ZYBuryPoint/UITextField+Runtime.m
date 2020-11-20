//
//  UITextField+Runtime.m
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/11/19.
//

#import "UITextField+Runtime.h"
#import <objc/runtime.h>

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

- (void)newSetReturnKeyType:(UIReturnKeyType)returnKeyType
{
    if (returnKeyType == UIReturnKeySearch) {
        [self addTarget:self action:@selector(textFieldDidEditingEnd:) forControlEvents:UIControlEventEditingDidEnd];
    }
}

- (void)textFieldDidEditingEnd:(UITextField *)textfield
{
    if (textfield.text.length != 0) {
        [ZYBuryPointRequest.shareBPR searchBuryPointAction:[ZYBuryPointProcess getCurrentVC] searchKey:textfield.text];
    }
}

@end
