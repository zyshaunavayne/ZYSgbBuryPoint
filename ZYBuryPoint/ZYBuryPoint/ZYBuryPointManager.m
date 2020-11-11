//
//  ZYBuryPointManager.m
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/11/11.
//

#import "ZYBuryPointManager.h"
@implementation ZYBuryPointManager

static ZYBuryPointManager *instance = nil;

+ (instancetype)manager
{
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            instance = [super allocWithZone:zone];
        });
    }
    return instance;
}

- (instancetype)init
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super init];
    });
    return instance;
}

- (void)openSGBBuryPointAction
{
    if (self.serverAdress.length == 0) {
        NSLog(@"请先配置服务器地址");
        return;
    }else{
        //开启方法交换
        [UIViewController share];
        
        //开启默认埋点信息记录
        [ZYBuryPointRequest.shareBPR requestBaseBuryPointAction];
    }
}

- (void)enterAppBuryPointAction
{
    if (self.serverAdress.length == 0) {
        NSLog(@"请先配置服务器地址");
        return;
    }else{
        [ZYBuryPointRequest.shareBPR enterAppBuryPointAction];
    }
}

- (void)leveaAppBuryPointAction
{
    if (self.serverAdress.length == 0) {
        NSLog(@"请先配置服务器地址");
        return;
    }else{
        [ZYBuryPointRequest.shareBPR leveaAppBuryPointAction];
    }
}

@end
