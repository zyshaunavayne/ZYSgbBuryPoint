//
//  ZYBuryPointRequestBaseModel.h
//  SGBProject
//
//  Created by 张宇 on 2020/11/6.
//  Copyright © 2020 dtx. All rights reserved.
//

#import <UIKit/UIKit.h>

//定位回调
typedef void(^locationBlock) (void);

@interface ZYBuryPointRequestBaseModel : NSObject

/// 城市（不用传值后台根据经纬度计算）
@property (nonatomic, strong) NSString * city;
/// 客户端（android，ios，h5,miniPrograms）
@property (nonatomic, strong) NSString * client;
/// App版本号
@property (nonatomic, strong) NSString * edition;
/// 用户ip 暂传ipv4
@property (nonatomic, strong) NSString * ip;
/// 纬度  用户未授权时传0
@property (nonatomic, strong) NSString * latitude;
/// 精度 用户未授权时传0
@property (nonatomic, strong) NSString * longitude;
/// 操作系统
@property (nonatomic, strong) NSString * operatingSystem;
/// 访问来源 app 不传
@property (nonatomic, strong) NSString * referer;
/// 地区（不用传值后台根据经纬度计算）
@property (nonatomic, strong) NSString * region;
/// 屏幕分辨率
@property (nonatomic, strong) NSString * screen;
/// 屏幕颜色 app不传
@property (nonatomic, strong) NSString * screenColorDepth;
/// 网络服务商 中国电信/中国移动/中国联通/中国铁通/其他
@property (nonatomic, strong) NSString * serviceProvider;
/// 项目 经营帮APP
@property (nonatomic, strong) NSString * type;
/// 用户唯一表示（从后台获取的真实用户ID）
@property (nonatomic, strong) NSString * userId;
/// 用户访问表示（每次访问网站，或者APP，或者移动端）
@property (nonatomic, strong) NSString * visitId;
/// 手机型号
@property (nonatomic, strong) NSString * code;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

/// 获取设备信息
- (NSString *)device;

/// 设备分辨率
- (NSString *)devicerp;

/// 获取ipv4
- (NSString *)ipv4;

/// 获取ipv6
- (NSString *)ipv6;

/// 网络服务商
- (NSString *)netServer;

/// 定位回调
/// @param location 定位
- (void)locationAction:(locationBlock)location;

@end
