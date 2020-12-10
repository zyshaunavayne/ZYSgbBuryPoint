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

+ (NSString *)check:(id)obj
{
    if ([obj length] == 0 || obj == nil || obj == [NSNull null] || obj == NULL || [obj isKindOfClass:[NSNull class]]) {
        return @"";
    }else{
        return obj;
    }
}

+ (id)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        currentVC = rootVC;
    }
    return currentVC;
}

+ (UIViewController *)getViewCurrentVCFromView:(id)view
{
    if (!view) {
        return nil;
    }
    
    UIViewController *result = nil;
    UIWindow *window = UIApplication.sharedApplication.keyWindow;
    if(window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = UIApplication.sharedApplication.windows;
        for(UIWindow *tmpWin in windows) {
            if(tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    id nextResponder = [view nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]] || [nextResponder isKindOfClass:[UIButton class]] || [nextResponder isKindOfClass:[UILabel class]] || [nextResponder isKindOfClass:[UIImageView class]] || [nextResponder isKindOfClass:[UITableView class]] || [nextResponder isKindOfClass:[UIScrollView class]] || [nextResponder isKindOfClass:[UICollectionView class]] || [nextResponder isKindOfClass:[UICollectionViewCell class]] || [nextResponder isKindOfClass:[UITableViewCell class]] || [nextResponder isKindOfClass:[UITableViewHeaderFooterView class]] || [nextResponder isKindOfClass:[UITableViewHeaderFooterView class]]) {
        result = [self getViewCurrentVCFromView:nextResponder];
    } else {
        result = nil;
    }
    return result;
}

@end
