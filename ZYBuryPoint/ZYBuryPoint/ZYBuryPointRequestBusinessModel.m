//
//  ZYBuryPointRequestBusinessModel.m
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/12/7.
//

//
//    ZYBuryPointRequestBusinessModel.m
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ZYBuryPointRequestBusinessModel.h"

NSString *const kZYBuryPointRequestBusinessModelContent = @"content";
NSString *const kZYBuryPointRequestBusinessModelEvent = @"event";
NSString *const kZYBuryPointRequestBusinessModelReportingEvent = @"reportingEvent";
NSString *const kZYBuryPointRequestBusinessModelRequestMethod = @"requestUri";
NSString *const kZYBuryPointRequestBusinessModelTask = @"task";
NSString *const kZYBuryPointRequestBusinessModelTime = @"time";
NSString *const kZYBuryPointRequestBusinessModelTitleId = @"titleId";
NSString *const kZYBuryPointRequestBusinessModelXAxis = @"xAxis";
NSString *const kZYBuryPointRequestBusinessModelYAxis = @"yAxis";

@interface ZYBuryPointRequestBusinessModel ()
@end
@implementation ZYBuryPointRequestBusinessModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kZYBuryPointRequestBusinessModelContent] isKindOfClass:[NSNull class]]){
        self.content = dictionary[kZYBuryPointRequestBusinessModelContent];
    }
    if(![dictionary[kZYBuryPointRequestBusinessModelEvent] isKindOfClass:[NSNull class]]){
        self.event = dictionary[kZYBuryPointRequestBusinessModelEvent];
    }
    if(![dictionary[kZYBuryPointRequestBusinessModelReportingEvent] isKindOfClass:[NSNull class]]){
        self.reportingEvent = dictionary[kZYBuryPointRequestBusinessModelReportingEvent];
    }
    if(![dictionary[kZYBuryPointRequestBusinessModelRequestMethod] isKindOfClass:[NSNull class]]){
        self.requestUrl = dictionary[kZYBuryPointRequestBusinessModelRequestMethod];
    }
    if(![dictionary[kZYBuryPointRequestBusinessModelTask] isKindOfClass:[NSNull class]]){
        self.task = dictionary[kZYBuryPointRequestBusinessModelTask];
    }
    if(![dictionary[kZYBuryPointRequestBusinessModelTime] isKindOfClass:[NSNull class]]){
        self.time = dictionary[kZYBuryPointRequestBusinessModelTime];
    }
    if(![dictionary[kZYBuryPointRequestBusinessModelTitleId] isKindOfClass:[NSNull class]]){
        self.titleId = dictionary[kZYBuryPointRequestBusinessModelTitleId];
    }
    if(![dictionary[kZYBuryPointRequestBusinessModelXAxis] isKindOfClass:[NSNull class]]){
        self.xAxis = [dictionary[kZYBuryPointRequestBusinessModelXAxis] floatValue];
    }

    if(![dictionary[kZYBuryPointRequestBusinessModelYAxis] isKindOfClass:[NSNull class]]){
        self.yAxis = [dictionary[kZYBuryPointRequestBusinessModelYAxis] floatValue];
    }

    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.content != nil){
        dictionary[kZYBuryPointRequestBusinessModelContent] = self.content;
    }
    if(self.event != nil){
        dictionary[kZYBuryPointRequestBusinessModelEvent] = self.event;
    }
    if(self.reportingEvent != nil){
        dictionary[kZYBuryPointRequestBusinessModelReportingEvent] = self.reportingEvent;
    }
    if(self.requestUrl != nil){
        dictionary[kZYBuryPointRequestBusinessModelRequestMethod] = self.requestUrl;
    }
    if(self.task != nil){
        dictionary[kZYBuryPointRequestBusinessModelTask] = self.task;
    }
    if(self.time != nil){
        dictionary[kZYBuryPointRequestBusinessModelTime] = self.time;
    }
    if(self.titleId != nil){
        dictionary[kZYBuryPointRequestBusinessModelTitleId] = self.titleId;
    }
    dictionary[kZYBuryPointRequestBusinessModelXAxis] = @(self.xAxis);
    dictionary[kZYBuryPointRequestBusinessModelYAxis] = @(self.yAxis);
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
    if(self.content != nil){
        [aCoder encodeObject:self.content forKey:kZYBuryPointRequestBusinessModelContent];
    }
    if(self.event != nil){
        [aCoder encodeObject:self.event forKey:kZYBuryPointRequestBusinessModelEvent];
    }
    if(self.reportingEvent != nil){
        [aCoder encodeObject:self.reportingEvent forKey:kZYBuryPointRequestBusinessModelReportingEvent];
    }
    if(self.requestUrl != nil){
        [aCoder encodeObject:self.requestUrl forKey:kZYBuryPointRequestBusinessModelRequestMethod];
    }
    if(self.task != nil){
        [aCoder encodeObject:self.task forKey:kZYBuryPointRequestBusinessModelTask];
    }
    if(self.time != nil){
        [aCoder encodeObject:self.time forKey:kZYBuryPointRequestBusinessModelTime];
    }
    if(self.titleId != nil){
        [aCoder encodeObject:self.titleId forKey:kZYBuryPointRequestBusinessModelTitleId];
    }
    [aCoder encodeObject:@(self.xAxis) forKey:kZYBuryPointRequestBusinessModelXAxis];    [aCoder encodeObject:@(self.yAxis) forKey:kZYBuryPointRequestBusinessModelYAxis];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.content = [aDecoder decodeObjectForKey:kZYBuryPointRequestBusinessModelContent];
    self.event = [aDecoder decodeObjectForKey:kZYBuryPointRequestBusinessModelEvent];
    self.reportingEvent = [aDecoder decodeObjectForKey:kZYBuryPointRequestBusinessModelReportingEvent];
    self.requestUrl = [aDecoder decodeObjectForKey:kZYBuryPointRequestBusinessModelRequestMethod];
    self.task = [aDecoder decodeObjectForKey:kZYBuryPointRequestBusinessModelTask];
    self.time = [aDecoder decodeObjectForKey:kZYBuryPointRequestBusinessModelTime];
    self.titleId = [aDecoder decodeObjectForKey:kZYBuryPointRequestBusinessModelTitleId];
    self.xAxis = [[aDecoder decodeObjectForKey:kZYBuryPointRequestBusinessModelXAxis] floatValue];
    self.yAxis = [[aDecoder decodeObjectForKey:kZYBuryPointRequestBusinessModelYAxis] floatValue];
    return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    ZYBuryPointRequestBusinessModel *copy = [ZYBuryPointRequestBusinessModel new];

    copy.content = [self.content copy];
    copy.event = [self.event copy];
    copy.reportingEvent = [self.reportingEvent copy];
    copy.requestUrl = [self.requestUrl copy];
    copy.task = [self.task copy];
    copy.time = [self.time copy];
    copy.titleId = [self.titleId copy];
    copy.xAxis = self.xAxis;
    copy.yAxis = self.yAxis;

    return copy;
}
@end
