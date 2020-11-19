//
//  UITextField+Runtime.m
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/11/19.
//

#import "UITextField+Runtime.h"

@implementation UITextField (Runtime)

+ (void)share
{
//    static dispatch_once_t onceGcd;
//    dispatch_once(&onceGcd, ^{
//        
//        //替换viewWillAppear
//        SEL systemSel1 = @selector(viewWillAppear:);
//        SEL newSel1 = @selector(searchAction);
//        Method systemMethod1 = class_getInstanceMethod([self class], systemSel1);
//        Method newMethod1 = class_getInstanceMethod([self class], newSel1);
//        BOOL success1 = class_addMethod(self, systemSel1, method_getImplementation(newMethod1), method_getTypeEncoding(newMethod1));
//        if (success1) {
//            class_replaceMethod(self, newSel1, method_getImplementation(systemMethod1), method_getTypeEncoding(systemMethod1));
//        }else{
//            method_exchangeImplementations(systemMethod1, newMethod1);
//        }
//    });
}

- (BOOL)newTextFieldShouldReturn:(UITextField *)textField
{
    if (textField.text.length != 0 && textField.returnKeyType == UIReturnKeySearch) {
        [ZYBuryPointRequest.shareBPR searchBuryPointAction:[ZYBuryPointProcess getCurrentVC] searchKey:textField.text];
    }
    return YES;
}

@end
