//
//  ZYBuryPointManager.m
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/11/11.
//

#import "ZYBuryPointManager.h"
#import <objc/runtime.h>

@implementation ZYBuryPointManagerRequest

- (void)creatUserNameWithModel:(id)model key:(NSString *)key
{
    if (model && key) {
        [model addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (object) {
        NSDictionary *dic = [self toDic:object];
        ZYBuryPointManager.manager.username = [dic objectForKey:[ZYBuryPointProcess check:keyPath]];
    }
}

- (NSDictionary *)toDic:(id)object
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([object class], &outCount);
    for (i = 0; i < outCount; i ++) {
        objc_property_t property = properties[i];
        const char* char_f = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}

@end

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
    if (self.request.serverAdress.length == 0) {
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
    if (self.request.serverAdress.length == 0) {
        NSLog(@"请先配置服务器地址");
        return;
    }else{
        [ZYBuryPointRequest.shareBPR enterAppBuryPointAction];
    }
}

- (void)leveaAppBuryPointAction
{
    if (self.request.serverAdress.length == 0) {
        NSLog(@"请先配置服务器地址");
        return;
    }else{
        [ZYBuryPointRequest.shareBPR leveaAppBuryPointAction];
    }
}

@end
