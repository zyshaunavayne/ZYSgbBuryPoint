//
//  ZYBuryPointRequestModel.h
//  SGBProject
//
//  Created by 张宇 on 2020/10/26.
//  Copyright © 2020 dtx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYBuryPointRequestModel : NSObject
@property (nonatomic, strong) NSString * phoneCode; //UDID
@property (nonatomic, strong) NSString * operatingSystem; //操作系统
@property (nonatomic, strong) NSString * city; //城市
@property (nonatomic, strong) NSString * messagePush; //消息推送唤醒app  0 是消息推送唤醒 1不是")(不确定是否能获取到，目前没有实现
@property (nonatomic, strong) NSString * pageView; //访问页面 采用事件埋点的方式（麻烦各位看看移动端能不能像web一样搞个拦截器或者监听器，要不工作量会很大
@property (nonatomic, strong) NSString * region; //地区
@property (nonatomic, strong) NSString * searchTerms; //搜索词
@property (nonatomic, strong) NSString * timeStampEnd; //App结束时间戳
@property (nonatomic, strong) NSString * timeStampPageEnd; //某个页面的停留结束时间戳
@property (nonatomic, strong) NSString * timeStampPageStart; //某个页面的开始开始时间戳
@property (nonatomic, strong) NSString * timeStampStart; //App开始使用时间戳
@property (nonatomic, strong) NSString * type; //项目 例如pc的大首页为sy，pc的招采为zc
@property (nonatomic, strong) NSString * userName; //用户ID 未登录用户没有 
@property (nonatomic, strong) NSString * visitId; //访问唯一表示 用户未登录或者已经登录，每次打开app都是一个新的访问标识
@property (nonatomic, strong) NSString * isUse; //是否使用 0 使用 1未使用 每次打开app都算作使用关闭或者退出，切换后台多少时间未唤醒都视为未使用

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
