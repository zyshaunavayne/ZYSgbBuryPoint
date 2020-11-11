//
//  ZYBuryPointProcess.m
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/11/11.
//

#import "ZYBuryPointProcess.h"

@implementation ZYBuryPointProcess

+ (void)saveData:(id)data key:(NSString *)key
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:key];
    NSData *saveData = [NSKeyedArchiver archivedDataWithRootObject:data];
    [saveData writeToFile:path atomically:NO];
}

+ (id)archiveDataWithKey:(NSString *)key
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:key];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

+ (void)removeDataWithKey:(NSString *)key
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:key];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

+ (NSString *)timeStap
{
    NSDate *nowDate = [NSDate date];
    return [NSString stringWithFormat:@"%ld000", (long)[nowDate timeIntervalSince1970]];
}

@end
