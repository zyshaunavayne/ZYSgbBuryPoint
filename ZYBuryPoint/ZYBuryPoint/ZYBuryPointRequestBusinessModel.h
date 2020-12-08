//
//  ZYBuryPointRequestBusinessModel.h
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/12/7.
//

#import <UIKit/UIKit.h>

@interface ZYBuryPointRequestBusinessModel : NSObject

/// 事件内容补充（用户进行了搜索那content为搜索词）
@property (nonatomic, strong) NSString * content;
/// 事件（click，keydown，UIView，Touch）
@property (nonatomic, strong) NSString * event;
/// 上报事件（支付，查询，搜索）
@property (nonatomic, strong) NSString * reportingEvent;
/// 请求后台的方式（post，get，put）
@property (nonatomic, strong) NSString * requestMethod;
/// 用户具体操作的名称（用户点击了加入购物车按键task的值为“加入购物车”如果没有有button名称则需要自定义）
@property (nonatomic, strong) NSString * task;
/// 时间戳(用户进行操作的时间戳)
@property (nonatomic, strong) NSString * time;
/// 该页面的ID（由前端进行自定义，自定义完成之后不再发生改变）
@property (nonatomic, strong) NSString * titleId;
/// x轴坐标(用户进行操作时的x轴坐标)
@property (nonatomic, assign) CGFloat xAxis;
/// y轴坐标(用户进行操作时的y轴坐标)
@property (nonatomic, assign) CGFloat yAxis;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
