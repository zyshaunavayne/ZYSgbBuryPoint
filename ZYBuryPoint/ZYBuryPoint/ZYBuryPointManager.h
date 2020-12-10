//
//  ZYBuryPointManager.h
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/11/11.
//

#import <Foundation/Foundation.h>
#import "ZYBuryPointRequest.h"
#import "UIViewController+Runtime.h"
#import "UITextField+Runtime.h"
#import "UIButton+BPRuntime.h"
#import "ZYBuryPointVCInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYBuryPointManagerRequest : NSObject

/// 设置服务器地址
@property (nonatomic, copy) NSString *serverAdress;

/// 设置基础信息url
@property (nonatomic, copy) NSString *baseUrl;

/// 设置埋点url
@property (nonatomic, copy) NSString *buryPointUrl;

/// 页面信息数组 源数据
@property (nonatomic, copy) NSArray *originVCInoArray;

/// 页面信息数组   key:class name  value:class model信息 <ZYBuryPointVCInfoModel *>
@property (nonatomic, strong) NSMutableDictionary *vcInfoDic;

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

/// 用户信息中userid参数
/// 此参数为动态变化
@property (nonatomic, copy) NSString *userId;

@end

NS_ASSUME_NONNULL_END
