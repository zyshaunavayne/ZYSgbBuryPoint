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
        
        SEL systemSel = @selector(textFieldShouldReturn:);
        SEL newSel = @selector(newTextFieldShouldReturn:);
        Method systemMth = class_getInstanceMethod([self class], systemSel);
        Method newMth = class_getInstanceMethod([self class], newSel);
        BOOL success = class_addMethod(self, systemSel, method_getImplementation(newMth), method_getTypeEncoding(newMth));
        if (success) {
            class_replaceMethod(self, newSel, method_getImplementation(systemMth), method_getTypeEncoding(systemMth));
        }else{
            method_exchangeImplementations(systemMth, newMth);
        }
        
    });
}

- (BOOL)newTextFieldShouldReturn:(UITextField *)textField
{
    if (textField.text.length != 0 && textField.returnKeyType == UIReturnKeySearch) {
        [ZYBuryPointRequest.shareBPR searchBuryPointAction:[ZYBuryPointProcess getCurrentVC] searchKey:textField.text];
    }
    return YES;
}

@end
