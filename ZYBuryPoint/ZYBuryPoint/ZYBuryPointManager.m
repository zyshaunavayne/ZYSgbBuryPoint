//
//  ZYBuryPointManager.m
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/11/11.
//

#import "ZYBuryPointManager.h"
#import <objc/runtime.h>

@implementation ZYBuryPointManagerRequest

- (void)setOriginVCInoArray:(NSArray *)originVCInoArray
{
    NSMutableArray *listArray = NSMutableArray.alloc.init;
    
    NSMutableDictionary *infoDic = NSMutableDictionary.alloc.init;
    for (NSDictionary *dic in listArray) {
        ZYBuryPointVCInfoModel *model = [ZYBuryPointVCInfoModel.alloc initWithDictionary:dic];
        [infoDic setObject:model forKey:[ZYBuryPointProcess check:model.iOS]];
    }
    self.vcInfoDic = infoDic;
}

- (void)creatUserNameWithModel:(id)model key:(NSString *)key
{
    if (model && key) {
        [model addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (object && keyPath) {
        ZYBuryPointManager.manager.userId = [self archive:object key:keyPath];
    }
}

- (NSString *)archive:(id)object key:(NSString *)key
{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([object class], &count);
    NSString *vlaue = @"";
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        if ([name isEqualToString:key]) {
            vlaue = [ZYBuryPointProcess check:[object valueForKey:key]];
            break;
        }
    }
    return vlaue;
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
        [UITextField share];
        
        //开启默认埋点信息记录
        [ZYBuryPointRequest.shareBPR requestBaseBuryPointAction];
    }
}

@end
