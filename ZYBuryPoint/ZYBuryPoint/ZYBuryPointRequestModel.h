//
//  ZYBuryPointRequestModel.h
//  SGBProject
//
//  Created by 张宇 on 2020/10/26.
//  Copyright © 2020 dtx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYBuryPointRequestModel : NSObject

/// 访问结束的时间戳
@property (nonatomic, strong) NSString * endTime;
/// 开始访问改页面的时间戳
@property (nonatomic, strong) NSString * stratTime;
/// 页面title名称（没有的根据上个按键上的名称，在没有进行沟通自定义）
@property (nonatomic, strong) NSString * title;
/// 该页面的ID（由前端进行自定义，自定义完成之后不再发生改变）
@property (nonatomic, strong) NSString * titleId;
/// 用户访问表示
@property (nonatomic, strong) NSString * visitId;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
