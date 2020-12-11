//
//  ZYBuryPointProcess.h
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/11/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// <#Description#>
@interface ZYBuryPointProcess : NSObject

/// 缓存数据
/// @param data 数据
/// @param key key
+ (void)saveData:(id)data key:(NSString *)key;

/// 获取缓存数据
/// @param key key
+ (id)archiveDataWithKey:(NSString *)key;

/// 移除缓存数据
/// @param key key
+ (void)removeDataWithKey:(NSString *)key;

/// 13位当前时间戳
+ (NSString *)timeStap;

/// 检测为空
/// @param obj 内容
+ (NSString *)check:(id)obj;

/// 获取当前页面
+ (UIViewController *)getCurrentVC;

/// 获取当前UI控件所在的页面 
/// @param view UIView、UILabel、Uibutton、UITableView等子控件
+ (UIViewController *)getViewCurrentVCFromView:(id )view;

/// 获取当前UI控件在他所在的控制器中的相对位置
/// @param View UIView、UILabel、Uibutton、UITableView等子控件
+ (CGSize)getViewRectInCurrentVCFromView:(id)View;

@end

NS_ASSUME_NONNULL_END
