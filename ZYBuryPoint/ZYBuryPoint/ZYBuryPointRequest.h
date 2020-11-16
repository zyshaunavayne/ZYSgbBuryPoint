//
//  ZYBuryPointRequest.h
//  SGBProject
//
//  Created by 张宇 on 2020/10/26.
//  Copyright © 2020 dtx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYBuryPointManager.h"

//基础信息
#import "ZYBuryPointRequestBaseModel.h"
//埋点信息
#import "ZYBuryPointRequestModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYBuryPointRequest : NSObject

/// 初始化
+ (instancetype)shareBPR;

/// 埋点基础信息
@property (nonatomic, strong) ZYBuryPointRequestBaseModel *requestBaseModel;

/// 基础埋点操作
- (void)requestBaseBuryPointAction;

/// 入参
@property (nonatomic, strong) ZYBuryPointRequestModel *requestModel;

/// 开始当前页面埋点
/// @param superVC 父类
- (void)beginBuryPointAction:(UIViewController *)superVC;

/// 结束当前页面埋点
/// @param superVC 父类
- (void)endBuryPointAction:(UIViewController *)superVC;

/// 进入app埋点
- (void)enterAppBuryPointAction;

/// 离开app埋点
- (void)leveaAppBuryPointAction;

@end

NS_ASSUME_NONNULL_END
