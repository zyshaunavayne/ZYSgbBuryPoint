//
//  ZYBuryPointManager.h
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/11/11.
//

#import <Foundation/Foundation.h>
#import "ZYBuryPointRequest.h"
#import "UIViewController+Runtime.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYBuryPointManagerRequest : NSObject

/// 设置服务器地址
@property (nonatomic, copy) NSString *serverAdress;

/// 设置基础信息url
@property (nonatomic, copy) NSString *baseUrl;

/// 设置埋点url
@property (nonatomic, copy) NSString *buryPointUrl;

/// 创建并监听username
/// @param model username对应的model
/// @param key model属性名
- (void)creatUserNameWithModel:(id)model key:(NSString *)key;

@end

@interface ZYBuryPointManager : NSObject

/// 初始化
+ (instancetype)manager;

/// 必要传入的参数
@property (nonatomic, strong) ZYBuryPointManagerRequest *request;

/// 开启SGB埋点 自动对页面进行埋点
/// appdelegate lunch协议中 调用
/// 调用此方法前请先配置request信息
- (void)openSGBBuryPointAction;

/// 打开app时，在appdelegate协议中调用  调用此方法前请先配置request信息
- (void)enterAppBuryPointAction;

/// 手机锁屏、Home时在appdelegate中调用  调用此方法前请先配置request信息
- (void)leveaAppBuryPointAction;

/// 用户信息中username参数
/// 此参数为动态变化
@property (nonatomic, copy) NSString *username;

@end

NS_ASSUME_NONNULL_END
