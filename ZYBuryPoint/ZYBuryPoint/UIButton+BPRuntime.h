//
//  UIButton+BPRuntime.h
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/12/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (BPRuntime)

/// 上报类型  查询、支付、搜索
@property (nonatomic, copy) NSString *reportingEvent;

/// 用户具体操作的名称（用户点击了加入购物车按键task的值为“加入购物车”如果没有有button名称则需要自定义），如果不填默认为button.label.text
@property (nonatomic, copy) NSString *reportingTask;

/// 网络请求对应的url 暂定为子url部分
@property (nonatomic, copy) NSString *reportingUrl;

/// 开启
+ (void)share;

@end

NS_ASSUME_NONNULL_END
