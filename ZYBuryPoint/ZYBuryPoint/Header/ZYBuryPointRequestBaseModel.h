//
//  ZYBuryPointRequestBaseModel.h
//  SGBProject
//
//  Created by 张宇 on 2020/11/6.
//  Copyright © 2020 dtx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYBuryPointRequestBaseModel : NSObject

@property (nonatomic, strong) NSString * client; //手机型号
@property (nonatomic, strong) NSString * edition; //App版本号
@property (nonatomic, strong) NSString * installationChannel; //安装渠道 不确定是否能获取到，可以实现，但目前没有做渠道分包
@property (nonatomic, strong) NSString * operatingSystem; //操作系统
@property (nonatomic, strong) NSString * phoneCoode; //设备编号 UDID
@property (nonatomic, strong) NSString * timeStamp; //安装时间戳 (不确定是否能获取到，可以获取第一次打开的时间戳

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

/// 获取手机型号
- (NSString *)device;

@end
