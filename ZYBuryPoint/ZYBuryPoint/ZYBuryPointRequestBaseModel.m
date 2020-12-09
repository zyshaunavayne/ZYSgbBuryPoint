//
//  ZYBuryPointRequestBaseModel.m
//  SGBProject
//
//  Created by 张宇 on 2020/11/6.
//  Copyright © 2020 dtx. All rights reserved.
//

//
//    ZYBuryPointRequestBaseModel.m



#import "ZYBuryPointRequestBaseModel.h"
#import <sys/utsname.h>

//获取ip地址需要导入
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>
 
#define IOS_CELLULAR    @"pdp_ip0"
//有些分配的地址为en0 有些分配的en1
#define IOS_WIFI2       @"en2"
#define IOS_WIFI1       @"en1"
#define IOS_WIFI        @"en0"
//#define IOS_VPN       @"utun0"  vpn很少用到可以注释
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

//获取网络服务商
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

//获取当前经纬度 系统自带定位
#import <CoreLocation/CoreLocation.h>


NSString *const kZYBuryPointRequestBaseModelCity = @"city";
NSString *const kZYBuryPointRequestBaseModelClient = @"client";
NSString *const kZYBuryPointRequestBaseModelEdition = @"edition";
NSString *const kZYBuryPointRequestBaseModelIp = @"ip";
NSString *const kZYBuryPointRequestBaseModelLatitude = @"latitude";
NSString *const kZYBuryPointRequestBaseModelLongitude = @"longitude";
NSString *const kZYBuryPointRequestBaseModelOperatingSystem = @"operatingSystem";
NSString *const kZYBuryPointRequestBaseModelReferer = @"referer";
NSString *const kZYBuryPointRequestBaseModelRegion = @"region";
NSString *const kZYBuryPointRequestBaseModelScreen = @"screen";
NSString *const kZYBuryPointRequestBaseModelScreenColorDepth = @"screenColorDepth";
NSString *const kZYBuryPointRequestBaseModelServiceProvider = @"serviceProvider";
NSString *const kZYBuryPointRequestBaseModelType = @"type";
NSString *const kZYBuryPointRequestBaseModelUserId = @"userId";
NSString *const kZYBuryPointRequestBaseModelVisitId = @"visitId";
NSString *const kZYBuryPointRequestBaseModelCode = @"code";

@interface ZYBuryPointRequestBaseModel () <CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *manager;
@property (nonatomic, strong) locationBlock locBlock;
@end
@implementation ZYBuryPointRequestBaseModel



-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kZYBuryPointRequestBaseModelCity] isKindOfClass:[NSNull class]]){
        self.city = dictionary[kZYBuryPointRequestBaseModelCity];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelClient] isKindOfClass:[NSNull class]]){
        self.client = dictionary[kZYBuryPointRequestBaseModelClient];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelEdition] isKindOfClass:[NSNull class]]){
        self.edition = dictionary[kZYBuryPointRequestBaseModelEdition];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelIp] isKindOfClass:[NSNull class]]){
        self.ip = dictionary[kZYBuryPointRequestBaseModelIp];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelLatitude] isKindOfClass:[NSNull class]]){
        self.latitude = dictionary[kZYBuryPointRequestBaseModelLatitude];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelLongitude] isKindOfClass:[NSNull class]]){
        self.longitude = dictionary[kZYBuryPointRequestBaseModelLongitude];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelOperatingSystem] isKindOfClass:[NSNull class]]){
        self.operatingSystem = dictionary[kZYBuryPointRequestBaseModelOperatingSystem];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelReferer] isKindOfClass:[NSNull class]]){
        self.referer = dictionary[kZYBuryPointRequestBaseModelReferer];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelRegion] isKindOfClass:[NSNull class]]){
        self.region = dictionary[kZYBuryPointRequestBaseModelRegion];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelScreen] isKindOfClass:[NSNull class]]){
        self.screen = dictionary[kZYBuryPointRequestBaseModelScreen];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelScreenColorDepth] isKindOfClass:[NSNull class]]){
        self.screenColorDepth = dictionary[kZYBuryPointRequestBaseModelScreenColorDepth];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelServiceProvider] isKindOfClass:[NSNull class]]){
        self.serviceProvider = dictionary[kZYBuryPointRequestBaseModelServiceProvider];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelType] isKindOfClass:[NSNull class]]){
        self.type = dictionary[kZYBuryPointRequestBaseModelType];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelUserId] isKindOfClass:[NSNull class]]){
        self.userId = dictionary[kZYBuryPointRequestBaseModelUserId];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelVisitId] isKindOfClass:[NSNull class]]){
        self.visitId = dictionary[kZYBuryPointRequestBaseModelVisitId];
    }
    if(![dictionary[kZYBuryPointRequestBaseModelCode] isKindOfClass:[NSNull class]]){
        self.code = dictionary[kZYBuryPointRequestBaseModelCode];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.city != nil){
        dictionary[kZYBuryPointRequestBaseModelCity] = self.city;
    }
    if(self.client != nil){
        dictionary[kZYBuryPointRequestBaseModelClient] = self.client;
    }
    if(self.edition != nil){
        dictionary[kZYBuryPointRequestBaseModelEdition] = self.edition;
    }
    if(self.ip != nil){
        dictionary[kZYBuryPointRequestBaseModelIp] = self.ip;
    }
    if(self.latitude != nil){
        dictionary[kZYBuryPointRequestBaseModelLatitude] = self.latitude;
    }
    if(self.longitude != nil){
        dictionary[kZYBuryPointRequestBaseModelLongitude] = self.longitude;
    }
    if(self.operatingSystem != nil){
        dictionary[kZYBuryPointRequestBaseModelOperatingSystem] = self.operatingSystem;
    }
    if(self.referer != nil){
        dictionary[kZYBuryPointRequestBaseModelReferer] = self.referer;
    }
    if(self.region != nil){
        dictionary[kZYBuryPointRequestBaseModelRegion] = self.region;
    }
    if(self.screen != nil){
        dictionary[kZYBuryPointRequestBaseModelScreen] = self.screen;
    }
    if(self.screenColorDepth != nil){
        dictionary[kZYBuryPointRequestBaseModelScreenColorDepth] = self.screenColorDepth;
    }
    if(self.serviceProvider != nil){
        dictionary[kZYBuryPointRequestBaseModelServiceProvider] = self.serviceProvider;
    }
    if(self.type != nil){
        dictionary[kZYBuryPointRequestBaseModelType] = self.type;
    }
    if(self.userId != nil){
        dictionary[kZYBuryPointRequestBaseModelUserId] = self.userId;
    }
    if(self.visitId != nil){
        dictionary[kZYBuryPointRequestBaseModelVisitId] = self.visitId;
    }
    if(self.code != nil){
        dictionary[kZYBuryPointRequestBaseModelCode] = self.code;
    }
    return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if(self.city != nil){
        [aCoder encodeObject:self.city forKey:kZYBuryPointRequestBaseModelCity];
    }
    if(self.client != nil){
        [aCoder encodeObject:self.client forKey:kZYBuryPointRequestBaseModelClient];
    }
    if(self.edition != nil){
        [aCoder encodeObject:self.edition forKey:kZYBuryPointRequestBaseModelEdition];
    }
    if(self.ip != nil){
        [aCoder encodeObject:self.ip forKey:kZYBuryPointRequestBaseModelIp];
    }
    if(self.latitude != nil){
        [aCoder encodeObject:self.latitude forKey:kZYBuryPointRequestBaseModelLatitude];
    }
    if(self.longitude != nil){
        [aCoder encodeObject:self.longitude forKey:kZYBuryPointRequestBaseModelLongitude];
    }
    if(self.operatingSystem != nil){
        [aCoder encodeObject:self.operatingSystem forKey:kZYBuryPointRequestBaseModelOperatingSystem];
    }
    if(self.referer != nil){
        [aCoder encodeObject:self.referer forKey:kZYBuryPointRequestBaseModelReferer];
    }
    if(self.region != nil){
        [aCoder encodeObject:self.region forKey:kZYBuryPointRequestBaseModelRegion];
    }
    if(self.screen != nil){
        [aCoder encodeObject:self.screen forKey:kZYBuryPointRequestBaseModelScreen];
    }
    if(self.screenColorDepth != nil){
        [aCoder encodeObject:self.screenColorDepth forKey:kZYBuryPointRequestBaseModelScreenColorDepth];
    }
    if(self.serviceProvider != nil){
        [aCoder encodeObject:self.serviceProvider forKey:kZYBuryPointRequestBaseModelServiceProvider];
    }
    if(self.type != nil){
        [aCoder encodeObject:self.type forKey:kZYBuryPointRequestBaseModelType];
    }
    if(self.userId != nil){
        [aCoder encodeObject:self.userId forKey:kZYBuryPointRequestBaseModelUserId];
    }
    if(self.visitId != nil){
        [aCoder encodeObject:self.visitId forKey:kZYBuryPointRequestBaseModelVisitId];
    }
    if(self.code != nil){
        [aCoder encodeObject:self.code forKey:kZYBuryPointRequestBaseModelCode];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.city = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelCity];
    self.client = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelClient];
    self.edition = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelEdition];
    self.ip = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelIp];
    self.latitude = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelLatitude];
    self.longitude = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelLongitude];
    self.operatingSystem = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelOperatingSystem];
    self.referer = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelReferer];
    self.region = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelRegion];
    self.screen = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelScreen];
    self.screenColorDepth = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelScreenColorDepth];
    self.serviceProvider = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelServiceProvider];
    self.type = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelType];
    self.userId = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelUserId];
    self.visitId = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelVisitId];
    self.code = [aDecoder decodeObjectForKey:kZYBuryPointRequestBaseModelCode];
    return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    ZYBuryPointRequestBaseModel *copy = [ZYBuryPointRequestBaseModel new];

    copy.city = [self.city copy];
    copy.client = [self.client copy];
    copy.edition = [self.edition copy];
    copy.ip = [self.ip copy];
    copy.latitude = [self.latitude copy];
    copy.longitude = [self.longitude copy];
    copy.operatingSystem = [self.operatingSystem copy];
    copy.referer = [self.referer copy];
    copy.region = [self.region copy];
    copy.screen = [self.screen copy];
    copy.screenColorDepth = [self.screenColorDepth copy];
    copy.serviceProvider = [self.serviceProvider copy];
    copy.type = [self.type copy];
    copy.userId = [self.userId copy];
    copy.visitId = [self.visitId copy];
    copy.code = [self.code copy];

    return copy;
}

- (NSString *)device
{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
   
    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceModel isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([deviceModel isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceModel isEqualToString:@"iPhone8,4"])    return @"iPhone SE";

    //日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([deviceModel isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,1"])   return @"iPhone_8";
    if ([deviceModel isEqualToString:@"iPhone10,4"])   return @"iPhone_8";
    if ([deviceModel isEqualToString:@"iPhone10,2"])   return @"iPhone_8_Plus";
    if ([deviceModel isEqualToString:@"iPhone10,5"])   return @"iPhone_8_Plus";
    if ([deviceModel isEqualToString:@"iPhone10,3"])   return @"iPhone X";
    if ([deviceModel isEqualToString:@"iPhone10,6"])   return @"iPhone X";
    if ([deviceModel isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    if ([deviceModel isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([deviceModel isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
    if ([deviceModel isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
    if ([deviceModel isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
    if ([deviceModel isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
    if ([deviceModel isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
    if ([deviceModel isEqualToString:@"iPhone12,8"])   return @"iPhone SE2";
    if ([deviceModel isEqualToString:@"iPhone13,1"])   return @"iPhone 12 mini";
    if ([deviceModel isEqualToString:@"iPhone13,2"])   return @"iPhone 12";
    if ([deviceModel isEqualToString:@"iPhone13,3"])   return @"iPhone 12 Pro";
    if ([deviceModel isEqualToString:@"iPhone13,4"])   return @"iPhone 12 Pro Max";
    if ([deviceModel isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceModel isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceModel isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceModel isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceModel isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    if ([deviceModel isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceModel isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([deviceModel isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceModel isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceModel isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceModel isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceModel isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceModel isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceModel isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([deviceModel isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceModel isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([deviceModel isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([deviceModel isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([deviceModel isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([deviceModel isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";

    if ([deviceModel isEqualToString:@"AppleTV2,1"])      return @"Apple TV 2";
    if ([deviceModel isEqualToString:@"AppleTV3,1"])      return @"Apple TV 3";
    if ([deviceModel isEqualToString:@"AppleTV3,2"])      return @"Apple TV 3";
    if ([deviceModel isEqualToString:@"AppleTV5,3"])      return @"Apple TV 4";

    if ([deviceModel isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceModel isEqualToString:@"x86_64"])       return @"Simulator";
    
    return deviceModel;
}

- (NSString *)devicerp
{
    NSInteger width = UIScreen.mainScreen.bounds.size.width * UIScreen.mainScreen.scale;
    NSInteger height = UIScreen.mainScreen.bounds.size.height * UIScreen.mainScreen.scale;
    return [NSString stringWithFormat:@"%ld*%ld",(long)width,(long)height];
}

- (NSString *)ipv4
{
    return [self getIPAddress:YES];
}

- (NSString *)ipv6
{
    return [self getIPAddress:NO];
}

//获取设备当前网络IP地址（是获取IPv4 还是 IPv6）
- (NSString *)getIPAddress:(BOOL)preferIPv4
{
    NSArray *searchArray = preferIPv4 ?
    @[IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_WIFI2 @"/" IP_ADDR_IPv4, IOS_WIFI1 @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv4] :
    @[IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_WIFI2 @"/" IP_ADDR_IPv6, IOS_WIFI1 @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv6] ;
    NSDictionary *addresses = [self getIPAddresses];
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
        {
            address = addresses[key];
            if(address) *stop = YES;
        } ];
    return address ? address : @"0.0.0.0";
}

- (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP)) {
                continue;
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}

-  (NSString *)netServer
{
    CTTelephonyNetworkInfo *info = CTTelephonyNetworkInfo.alloc.init;
    CTCarrier *carrier = nil;
    NSString *radioType = nil;
    if (@available(iOS 12.1, *)) {
        if (info && [info respondsToSelector:@selector(serviceSubscriberCellularProviders)]) {
            NSDictionary *dic = [info serviceSubscriberCellularProviders];
            if (dic.allKeys.count) {
                carrier = [dic objectForKey:dic.allKeys[0]];
            }
        }
            
        if (info && [info respondsToSelector:@selector(serviceCurrentRadioAccessTechnology)]) {
            NSDictionary *radioDic = [info serviceCurrentRadioAccessTechnology];
            if (radioDic.allKeys.count) {
                radioType = [radioDic objectForKey:radioDic.allKeys[0]];
            }
        }
            
    } else {
        carrier = [info subscriberCellularProvider];
        radioType = [info currentRadioAccessTechnology];
    }
        
    NSString *currentCountryCode = [carrier mobileCountryCode];
    NSString *mobileNetWorkCode = [carrier mobileNetworkCode];
    if (![currentCountryCode isEqualToString:@"460"]) {
       return @"其他";
     }

     if ([mobileNetWorkCode isEqualToString:@"00"] ||
       [mobileNetWorkCode isEqualToString:@"02"] ||
         [mobileNetWorkCode isEqualToString:@"07"]) {
       return @"中国移动";
     }

     if ([mobileNetWorkCode isEqualToString:@"01"] ||
       [mobileNetWorkCode isEqualToString:@"06"] ||
         [mobileNetWorkCode isEqualToString:@"09"]) {
       return @"中国联通";
     }

     if ([mobileNetWorkCode isEqualToString:@"03"] ||
       [mobileNetWorkCode isEqualToString:@"05"] ||
       [mobileNetWorkCode isEqualToString:@"11"]) {
       return @"中国电信";
     }

     if ([mobileNetWorkCode isEqualToString:@"20"]) {
       return @"中国铁通";
     }
    
     return @"其他";
}

- (void)locationAction:(locationBlock)location
{
    _manager = CLLocationManager.alloc.init;
    _manager.delegate = self;
    [_manager requestAlwaysAuthorization];
    _locBlock = location;
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorizedAlways) {
        [_manager startUpdatingLocation];
        _manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        _manager.distanceFilter = 1000;
    } else {
        self.latitude = @"";
        self.longitude = @"";
        [_manager stopUpdatingLocation];
        _locBlock();
    }
}

#pragma mark - 定位代理
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = manager.location;
    CLLocationCoordinate2D corrdinate = location.coordinate;
    self.latitude = [NSString stringWithFormat:@"%.4lf",corrdinate.latitude];
    self.longitude = [NSString stringWithFormat:@"%.4lf",corrdinate.longitude];
    [_manager stopUpdatingLocation];
    _locBlock();
}

@end
