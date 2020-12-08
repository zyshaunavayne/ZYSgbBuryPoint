//
//  ZYBuryPointRequest.m
//  SGBProject
//
//  Created by 张宇 on 2020/10/26.
//  Copyright © 2020 dtx. All rights reserved.
//

#import "ZYBuryPointRequest.h"

//需要依赖AFNetworking
#import <AFNetworking/AFNetworking.h>

static NSString *firstOpenKey = @"ZYBuryPointRequest+firstOpenKey";

@interface ZYBuryPointRequest ()
@property (nonatomic, assign) BOOL netType;
@end
@implementation ZYBuryPointRequest

+ (instancetype)shareBPR
{
     return [[self alloc] init];
}

- (ZYBuryPointRequestBaseModel *)requestBaseModel
{
    if (!_requestBaseModel) {
        [self archiveFirstTime];
        _requestBaseModel = ZYBuryPointRequestBaseModel.alloc.init;
        _requestBaseModel.client = @"iOS";
        _requestBaseModel.edition = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        _requestBaseModel.ip = [_requestBaseModel ipv4];
        _requestBaseModel.operatingSystem = [[UIDevice currentDevice] systemVersion];
        _requestBaseModel.screen = [_requestBaseModel devicerp];
        _requestBaseModel.code = [_requestBaseModel device];
        _requestBaseModel.type = @"经营帮APP";
        _requestBaseModel.visitId = [ZYBuryPointProcess archiveDataWithKey:firstOpenKey];
        _requestBaseModel.serviceProvider = [_requestBaseModel netServer];
    }
    return _requestBaseModel;
}

- (void)requestBaseBuryPointAction
{
    [self.requestBaseModel locationAction:^{ //先获取经纬度 在开始埋点
        //基础信息埋点
        NSMutableDictionary *proDic = NSMutableDictionary.alloc.init;
        self.requestBaseModel.userId = [ZYBuryPointProcess check:ZYBuryPointManager.manager.username];
        
        [proDic setDictionary:self.requestBaseModel.toDictionary];
        [self requestUrl:[NSString stringWithFormat:@"%@%@",ZYBuryPointManager.manager.request.serverAdress,ZYBuryPointManager.manager.request.baseUrl] proDic:proDic success:^(id _Nonnull success) {}];
        
        //开启app进去时埋点
        [self enterAppBuryPointAction];
    }];
}

- (ZYBuryPointRequestModel *)requestModel
{
    if (!_requestModel) {
        _requestModel = ZYBuryPointRequestModel.alloc.init;
//        _requestModel.operatingSystem = [NSString stringWithFormat:@"iOS_%@",[[UIDevice currentDevice] systemVersion]];
//        _requestModel.phoneCode = [UIDevice.currentDevice.identifierForVendor UUIDString];
        _requestModel.visitId = [ZYBuryPointProcess archiveDataWithKey:firstOpenKey];
    }
//    _requestModel.userName = [ZYBuryPointProcess check:ZYBuryPointManager.manager.username];
    return _requestModel;
}

- (void)archiveFirstTime
{
    [ZYBuryPointProcess saveData:ZYBuryPointProcess.timeStap key:firstOpenKey];
}

- (void)beginBuryPointAction:(UIViewController *)superVC
{
    NSString *classStr = [NSString stringWithFormat:@"%@%@",NSStringFromClass(superVC.class),[ZYBuryPointProcess check:superVC.title]];
//    self.requestModel.timeStampPageStart = ZYBuryPointProcess.timeStap;
    [ZYBuryPointProcess saveData:ZYBuryPointProcess.timeStap key:classStr];
//    self.requestModel.pageView = [ZYBuryPointProcess check:superVC.title];
    [self requestAction];
}

- (void)endBuryPointAction:(UIViewController *)superVC
{
    NSString *classStr = [NSString stringWithFormat:@"%@%@",NSStringFromClass(superVC.class),[ZYBuryPointProcess check:superVC.title]];
//    self.requestModel.timeStampPageStart = [ZYBuryPointProcess check:[ZYBuryPointProcess archiveDataWithKey:classStr]];
    [ZYBuryPointProcess removeDataWithKey:classStr];
//    self.requestModel.timeStampPageEnd = ZYBuryPointProcess.timeStap;
//    self.requestModel.pageView = [ZYBuryPointProcess check:superVC.title];
    [self requestAction];
}

- (void)enterAppBuryPointAction
{
    [ZYBuryPointProcess saveData:ZYBuryPointProcess.timeStap key:@"enterAppBuryPointAction"];
//    self.requestModel.timeStampStart = ZYBuryPointProcess.timeStap;
    [self requestAction];
}

- (void)leveaAppBuryPointAction
{
//    self.requestModel.timeStampStart = [ZYBuryPointProcess check:[ZYBuryPointProcess archiveDataWithKey:@"enterAppBuryPointAction"]];
//    self.requestModel.timeStampEnd = ZYBuryPointProcess.timeStap;
    [ZYBuryPointProcess removeDataWithKey:@"enterAppBuryPointAction"];
    [self requestAction];
}

- (void)searchBuryPointAction:(UIViewController *)superVC searchKey:(NSString *)searchKey
{
    NSString *classStr = [NSString stringWithFormat:@"%@%@",NSStringFromClass(superVC.class),[ZYBuryPointProcess check:superVC.title]];
//    self.requestModel.timeStampPageStart = [ZYBuryPointProcess check:[ZYBuryPointProcess archiveDataWithKey:classStr]];
//    self.requestModel.pageView = [ZYBuryPointProcess check:superVC.title];
//    self.requestModel.searchTerms = [ZYBuryPointProcess check:searchKey];
    [self requestAction];
}

- (void)requestAction
{
    NSMutableDictionary *proDic = NSMutableDictionary.alloc.init;
    [proDic setDictionary:self.requestModel.toDictionary];
    [self requestUrl:[NSString stringWithFormat:@"%@%@",ZYBuryPointManager.manager.request.serverAdress,ZYBuryPointManager.manager.request.buryPointUrl] proDic:proDic success:^(id _Nonnull success) {}];
}

#pragma mark -- 以下可忽略
#pragma mark --
#pragma mark -- 埋点独立网络请求方式
- (void)requestUrl:(NSString *)url
            proDic:(NSMutableDictionary *)proDic
           success:(void (^)(id _Nonnull))result
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.securityPolicy.validatesDomainName = NO;
        manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        //请求
        AFJSONRequestSerializer *request = [AFJSONRequestSerializer serializer];
        request = [self requestJsonHeaderWithContent:request];
        manager.requestSerializer = request;
        
        //接收
        AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
        response = [self responseWithContentTypeWithResponse:response];
        manager.responseSerializer = response;
        
        //入参优化
        NSDictionary *infoDic = [self proDictionaryWithProDic:proDic url:url];
        
        //发起POST访问
        [manager POST:url parameters:infoDic progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dic = [self check:responseObject :url];
            if ([[dic objectForKey:@"state"] isEqualToString:@"OK"]) {
                result(dic);
            }else{
                NSLog(@"接口返回数据异常");
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"POST连接服务器异常 == %@",[error description]);
        }];
    });
}

/// 请求格式
/// @param request 请求入参格式
- (AFJSONRequestSerializer *)requestJsonHeaderWithContent:(AFJSONRequestSerializer *)request
{
    request.timeoutInterval = 30;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    return request;
}

///  请求返回结果配置
/// @param response 返回结果类型
- (AFJSONResponseSerializer *)responseWithContentTypeWithResponse:(AFJSONResponseSerializer *)response
{
    response.removesKeysWithNullValues = YES;
    [response setAcceptableContentTypes:[NSSet setWithObjects:@"application/json",
                                         @"text/json",@"text/html",
                                         @"text/javascript",@"text/plain",
                                         nil]];
    return response;
}

- (NSDictionary *)proDictionaryWithProDic:(NSMutableDictionary *)proDic url:(NSString *)url
{
    return proDic;
}

/// 返回结果
/// @param responseObject 返回结果
/// @param url url
- (NSDictionary *)check:(id)responseObject :(NSString *)url
{
    NSDictionary *dictionary = nil;
    if ([responseObject isKindOfClass:[NSDictionary class]])
    {
        dictionary = (NSDictionary*)responseObject;
    } else {
        if (responseObject) {
            dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        } else {
            dictionary = nil;
        }
    }
    return dictionary;
}

@end
