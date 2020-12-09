//
//  ZYBuryPointVCInfoModel.h
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/12/9.
//

#import <UIKit/UIKit.h>

@interface ZYBuryPointVCInfoModel : NSObject

/// 安卓页面
@property (nonatomic, strong) NSString * android;

/// iOS页面
@property (nonatomic, strong) NSString * iOS;

/// 页面title
@property (nonatomic, strong) NSString * title;

/// 页面id
@property (nonatomic, strong) NSString * titleId;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
