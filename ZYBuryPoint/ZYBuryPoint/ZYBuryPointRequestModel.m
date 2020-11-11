//
//  ZYBuryPointRequestModel.m
//  SGBProject
//
//  Created by 张宇 on 2020/10/26.
//  Copyright © 2020 dtx. All rights reserved.
//

//
//    ZYBuryPointRequestModel.m


#import "ZYBuryPointRequestModel.h"

NSString *const kZYBuryPointRequestModelCity = @"city";
NSString *const kZYBuryPointRequestModelMessagePush = @"messagePush";
NSString *const kZYBuryPointRequestModelPageView = @"pageView";
NSString *const kZYBuryPointRequestModelRegion = @"region";
NSString *const kZYBuryPointRequestModelSearchTerms = @"searchTerms";
NSString *const kZYBuryPointRequestModelTimeStampEnd = @"timeStampEnd";
NSString *const kZYBuryPointRequestModelTimeStampPageEnd = @"timeStampPageEnd";
NSString *const kZYBuryPointRequestModelTimeStampPageStart = @"timeStampPageStart";
NSString *const kZYBuryPointRequestModelTimeStampStart = @"timeStampStart";
NSString *const kZYBuryPointRequestModelType = @"type";
NSString *const kZYBuryPointRequestModelUserName = @"userName";
NSString *const kZYBuryPointRequestModelVisitId = @"visitId";
NSString *const kZYBuryPointRequestModeIsUse = @"isUse";

@interface ZYBuryPointRequestModel ()
@end
@implementation ZYBuryPointRequestModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kZYBuryPointRequestModelCity] isKindOfClass:[NSNull class]]){
        self.city = dictionary[kZYBuryPointRequestModelCity];
    }
    if(![dictionary[kZYBuryPointRequestModelMessagePush] isKindOfClass:[NSNull class]]){
        self.messagePush = dictionary[kZYBuryPointRequestModelMessagePush];
    }
    if(![dictionary[kZYBuryPointRequestModelPageView] isKindOfClass:[NSNull class]]){
        self.pageView = dictionary[kZYBuryPointRequestModelPageView];
    }
    if(![dictionary[kZYBuryPointRequestModelRegion] isKindOfClass:[NSNull class]]){
        self.region = dictionary[kZYBuryPointRequestModelRegion];
    }
    if(![dictionary[kZYBuryPointRequestModelSearchTerms] isKindOfClass:[NSNull class]]){
        self.searchTerms = dictionary[kZYBuryPointRequestModelSearchTerms];
    }
    if(![dictionary[kZYBuryPointRequestModelTimeStampEnd] isKindOfClass:[NSNull class]]){
        self.timeStampEnd = dictionary[kZYBuryPointRequestModelTimeStampEnd];
    }
    if(![dictionary[kZYBuryPointRequestModelTimeStampPageEnd] isKindOfClass:[NSNull class]]){
        self.timeStampPageEnd = dictionary[kZYBuryPointRequestModelTimeStampPageEnd];
    }
    if(![dictionary[kZYBuryPointRequestModelTimeStampPageStart] isKindOfClass:[NSNull class]]){
        self.timeStampPageStart = dictionary[kZYBuryPointRequestModelTimeStampPageStart];
    }
    if(![dictionary[kZYBuryPointRequestModelTimeStampStart] isKindOfClass:[NSNull class]]){
        self.timeStampStart = dictionary[kZYBuryPointRequestModelTimeStampStart];
    }
    if(![dictionary[kZYBuryPointRequestModelType] isKindOfClass:[NSNull class]]){
        self.type = dictionary[kZYBuryPointRequestModelType];
    }
    if(![dictionary[kZYBuryPointRequestModelUserName] isKindOfClass:[NSNull class]]){
        self.userName = dictionary[kZYBuryPointRequestModelUserName];
    }
    if(![dictionary[kZYBuryPointRequestModelVisitId] isKindOfClass:[NSNull class]]){
        self.visitId = dictionary[kZYBuryPointRequestModelVisitId];
    }
    if(![dictionary[kZYBuryPointRequestModeIsUse] isKindOfClass:[NSNull class]]){
        self.isUse = dictionary[kZYBuryPointRequestModeIsUse];
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
        dictionary[kZYBuryPointRequestModelCity] = self.city;
    }
    if(self.messagePush != nil){
        dictionary[kZYBuryPointRequestModelMessagePush] = self.messagePush;
    }
    if(self.pageView != nil){
        dictionary[kZYBuryPointRequestModelPageView] = self.pageView;
    }
    if(self.region != nil){
        dictionary[kZYBuryPointRequestModelRegion] = self.region;
    }
    if(self.searchTerms != nil){
        dictionary[kZYBuryPointRequestModelSearchTerms] = self.searchTerms;
    }
    if(self.timeStampEnd != nil){
        dictionary[kZYBuryPointRequestModelTimeStampEnd] = self.timeStampEnd;
    }
    if(self.timeStampPageEnd != nil){
        dictionary[kZYBuryPointRequestModelTimeStampPageEnd] = self.timeStampPageEnd;
    }
    if(self.timeStampPageStart != nil){
        dictionary[kZYBuryPointRequestModelTimeStampPageStart] = self.timeStampPageStart;
    }
    if(self.timeStampStart != nil){
        dictionary[kZYBuryPointRequestModelTimeStampStart] = self.timeStampStart;
    }
    if(self.type != nil){
        dictionary[kZYBuryPointRequestModelType] = self.type;
    }
    if(self.userName != nil){
        dictionary[kZYBuryPointRequestModelUserName] = self.userName;
    }
    if(self.visitId != nil){
        dictionary[kZYBuryPointRequestModelVisitId] = self.visitId;
    }
    if(self.isUse != nil){
        dictionary[kZYBuryPointRequestModeIsUse] = self.isUse;
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
        [aCoder encodeObject:self.city forKey:kZYBuryPointRequestModelCity];
    }
    if(self.messagePush != nil){
        [aCoder encodeObject:self.messagePush forKey:kZYBuryPointRequestModelMessagePush];
    }
    if(self.pageView != nil){
        [aCoder encodeObject:self.pageView forKey:kZYBuryPointRequestModelPageView];
    }
    if(self.region != nil){
        [aCoder encodeObject:self.region forKey:kZYBuryPointRequestModelRegion];
    }
    if(self.searchTerms != nil){
        [aCoder encodeObject:self.searchTerms forKey:kZYBuryPointRequestModelSearchTerms];
    }
    if(self.timeStampEnd != nil){
        [aCoder encodeObject:self.timeStampEnd forKey:kZYBuryPointRequestModelTimeStampEnd];
    }
    if(self.timeStampPageEnd != nil){
        [aCoder encodeObject:self.timeStampPageEnd forKey:kZYBuryPointRequestModelTimeStampPageEnd];
    }
    if(self.timeStampPageStart != nil){
        [aCoder encodeObject:self.timeStampPageStart forKey:kZYBuryPointRequestModelTimeStampPageStart];
    }
    if(self.timeStampStart != nil){
        [aCoder encodeObject:self.timeStampStart forKey:kZYBuryPointRequestModelTimeStampStart];
    }
    if(self.type != nil){
        [aCoder encodeObject:self.type forKey:kZYBuryPointRequestModelType];
    }
    if(self.userName != nil){
        [aCoder encodeObject:self.userName forKey:kZYBuryPointRequestModelUserName];
    }
    if(self.visitId != nil){
        [aCoder encodeObject:self.visitId forKey:kZYBuryPointRequestModelVisitId];
    }
    if(self.isUse != nil){
        [aCoder encodeObject:self.isUse forKey:kZYBuryPointRequestModeIsUse];
    }
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.city = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelCity];
    self.messagePush = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelMessagePush];
    self.pageView = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelPageView];
    self.region = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelRegion];
    self.searchTerms = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelSearchTerms];
    self.timeStampEnd = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelTimeStampEnd];
    self.timeStampPageEnd = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelTimeStampPageEnd];
    self.timeStampPageStart = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelTimeStampPageStart];
    self.timeStampStart = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelTimeStampStart];
    self.type = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelType];
    self.userName = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelUserName];
    self.visitId = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelVisitId];
    self.isUse = [aDecoder decodeObjectForKey:kZYBuryPointRequestModeIsUse];
    return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    ZYBuryPointRequestModel *copy = [ZYBuryPointRequestModel new];

    copy.city = [self.city copy];
    copy.messagePush = [self.messagePush copy];
    copy.pageView = [self.pageView copy];
    copy.region = [self.region copy];
    copy.searchTerms = [self.searchTerms copy];
    copy.timeStampEnd = [self.timeStampEnd copy];
    copy.timeStampPageEnd = [self.timeStampPageEnd copy];
    copy.timeStampPageStart = [self.timeStampPageStart copy];
    copy.timeStampStart = [self.timeStampStart copy];
    copy.type = [self.type copy];
    copy.userName = [self.userName copy];
    copy.visitId = [self.visitId copy];
    copy.isUse = [self.isUse copy];

    return copy;
}

@end
