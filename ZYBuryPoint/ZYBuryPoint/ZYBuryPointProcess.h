//
//  ZYBuryPointProcess.h
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/11/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

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

@end

NS_ASSUME_NONNULL_END
