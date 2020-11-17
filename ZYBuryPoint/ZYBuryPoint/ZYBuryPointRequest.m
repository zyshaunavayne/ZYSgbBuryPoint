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

static NSString *firstTimeKey = @"ZYBuryPointRequest+FirstTime";
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
        [self getNetTypeStatus];
        _requestBaseModel = ZYBuryPointRequestBaseModel.alloc.init;
        _requestBaseModel.operatingSystem = @"iOS";
        _requestBaseModel.phoneCoode = NSUUID.UUID.UUIDString;;
        _requestBaseModel.timeStamp = [ZYBuryPointProcess archiveDataWithKey:firstTimeKey];
        _requestBaseModel.client = [_requestBaseModel device];
        _requestBaseModel.edition = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        _requestBaseModel.installationChannel = @"App Store";
    }
    return _requestBaseModel;
}

- (void)requestBaseBuryPointAction
{
    //基础信息埋点
    NSMutableDictionary *proDic = NSMutableDictionary.alloc.init;
    [proDic setDictionary:self.requestBaseModel.toDictionary];
    [self requestUrl:[NSString stringWithFormat:@"%@%@",ZYBuryPointManager.manager.serverAdress,ZYBuryPointManager.manager.baseUrl] proDic:proDic success:^(id _Nonnull success) {}];
    
    //开启app进去时埋点
    [self enterAppBuryPointAction];
}

- (ZYBuryPointRequestModel *)requestModel
{
    if (!_requestModel) {
        _requestModel = ZYBuryPointRequestModel.alloc.init;
        _requestModel.messagePush = @"1";
        _requestModel.visitId = [NSString stringWithFormat:@"iOS %@",[ZYBuryPointProcess archiveDataWithKey:firstOpenKey]];
        _requestModel.userName = [ZYBuryPointProcess check:ZYBuryPointManager.manager.username];
    }
    return _requestModel;
}

- (void)archiveFirstTime
{
    if ([ZYBuryPointProcess archiveDataWithKey:firstTimeKey]) {} else {
        [ZYBuryPointProcess saveData:ZYBuryPointProcess.timeStap key:firstTimeKey];
    }
    
    [ZYBuryPointProcess saveData:ZYBuryPointProcess.timeStap key:firstOpenKey];
}

- (void)beginBuryPointAction:(UIViewController *)superVC
{
    NSString *classStr = [NSString stringWithFormat:@"%@%@",NSStringFromClass(superVC.class),[ZYBuryPointProcess check:superVC.title]];
    self.requestModel.timeStampPageStart = ZYBuryPointProcess.timeStap;
    [ZYBuryPointProcess saveData:ZYBuryPointProcess.timeStap key:classStr];
    self.requestModel.pageView = [ZYBuryPointProcess check:superVC.title];
    [self requestAction];
}

- (void)endBuryPointAction:(UIViewController *)superVC
{
    NSString *classStr = [NSString stringWithFormat:@"%@%@",NSStringFromClass(superVC.class),[ZYBuryPointProcess check:superVC.title]];
    self.requestModel.timeStampPageStart = [ZYBuryPointProcess check:[ZYBuryPointProcess archiveDataWithKey:classStr]];
    [ZYBuryPointProcess removeDataWithKey:classStr];
    self.requestModel.timeStampPageEnd = ZYBuryPointProcess.timeStap;
    self.requestModel.pageView = [ZYBuryPointProcess check:superVC.title];
    [self requestAction];
}

- (void)enterAppBuryPointAction
{
    [ZYBuryPointProcess saveData:ZYBuryPointProcess.timeStap key:@"enterAppBuryPointAction"];
    self.requestModel.timeStampStart = ZYBuryPointProcess.timeStap;
    [self requestAction];
}

- (void)leveaAppBuryPointAction
{
    self.requestModel.timeStampStart = [ZYBuryPointProcess check:[ZYBuryPointProcess archiveDataWithKey:@"enterAppBuryPointAction"]];
    self.requestModel.timeStampEnd = ZYBuryPointProcess.timeStap;
    [ZYBuryPointProcess removeDataWithKey:@"enterAppBuryPointAction"];
    [self requestAction];
}

- (void)requestAction
{
    NSMutableDictionary *proDic = NSMutableDictionary.alloc.init;
    [proDic setDictionary:self.requestModel.toDictionary];
    [self requestUrl:[NSString stringWithFormat:@"%@%@",ZYBuryPointManager.manager.serverAdress,ZYBuryPointManager.manager.buryPointUrl] proDic:proDic success:^(id _Nonnull success) {}];
}

#pragma mark -- 以下可忽略
#pragma mark --
#pragma mark -- 埋点独立网络请求方式
- (void)requestUrl:(NSString *)url
            proDic:(NSMutableDictionary *)proDic
           success:(void (^)(id _Nonnull))result
{

    if (!_netType) {
        [self getNetTypeStatus];
        return;
    }
    
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
        [manager POST:url parameters:infoDic headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
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
    NSLog(@"dictionary == %@",dictionary);
    return dictionary;
}

- (void)getNetTypeStatus
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager ] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if(status ==AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi) {
            self.netType = YES;
        } else {
            self.netType = NO;
        }
    }];
}

@end
