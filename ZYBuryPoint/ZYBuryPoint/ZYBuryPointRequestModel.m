//
//  ZYBuryPointRequestModel.m
//  SGBProject
//
//  Created by 张宇 on 2020/10/26.
//  Copyright © 2020 dtx. All rights reserved.
//

//
//    ZYBuryPointRequestModel.m


//
//    ZYBuryPointRequestModel.m
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ZYBuryPointRequestModel.h"

NSString *const kZYBuryPointRequestModelEndTime = @"endTime";
NSString *const kZYBuryPointRequestModelStratTime = @"stratTime";
NSString *const kZYBuryPointRequestModelTitle = @"title";
NSString *const kZYBuryPointRequestModelTitleId = @"titleId";
NSString *const kZYBuryPointRequestModelVisitId = @"visitId";

@interface ZYBuryPointRequestModel ()
@end
@implementation ZYBuryPointRequestModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kZYBuryPointRequestModelEndTime] isKindOfClass:[NSNull class]]){
        self.endTime = dictionary[kZYBuryPointRequestModelEndTime];
    }
    if(![dictionary[kZYBuryPointRequestModelStratTime] isKindOfClass:[NSNull class]]){
        self.stratTime = dictionary[kZYBuryPointRequestModelStratTime];
    }
    if(![dictionary[kZYBuryPointRequestModelTitle] isKindOfClass:[NSNull class]]){
        self.title = dictionary[kZYBuryPointRequestModelTitle];
    }
    if(![dictionary[kZYBuryPointRequestModelTitleId] isKindOfClass:[NSNull class]]){
        self.titleId = dictionary[kZYBuryPointRequestModelTitleId];
    }
    if(![dictionary[kZYBuryPointRequestModelVisitId] isKindOfClass:[NSNull class]]){
        self.visitId = dictionary[kZYBuryPointRequestModelVisitId];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.endTime != nil){
        dictionary[kZYBuryPointRequestModelEndTime] = self.endTime;
    }
    if(self.stratTime != nil){
        dictionary[kZYBuryPointRequestModelStratTime] = self.stratTime;
    }
    if(self.title != nil){
        dictionary[kZYBuryPointRequestModelTitle] = self.title;
    }
    if(self.titleId != nil){
        dictionary[kZYBuryPointRequestModelTitleId] = self.titleId;
    }
    if(self.visitId != nil){
        dictionary[kZYBuryPointRequestModelVisitId] = self.visitId;
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
    if(self.endTime != nil){
        [aCoder encodeObject:self.endTime forKey:kZYBuryPointRequestModelEndTime];
    }
    if(self.stratTime != nil){
        [aCoder encodeObject:self.stratTime forKey:kZYBuryPointRequestModelStratTime];
    }
    if(self.title != nil){
        [aCoder encodeObject:self.title forKey:kZYBuryPointRequestModelTitle];
    }
    if(self.titleId != nil){
        [aCoder encodeObject:self.titleId forKey:kZYBuryPointRequestModelTitleId];
    }
    if(self.visitId != nil){
        [aCoder encodeObject:self.visitId forKey:kZYBuryPointRequestModelVisitId];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.endTime = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelEndTime];
    self.stratTime = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelStratTime];
    self.title = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelTitle];
    self.titleId = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelTitleId];
    self.visitId = [aDecoder decodeObjectForKey:kZYBuryPointRequestModelVisitId];
    return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    ZYBuryPointRequestModel *copy = [ZYBuryPointRequestModel new];

    copy.endTime = [self.endTime copy];
    copy.stratTime = [self.stratTime copy];
    copy.title = [self.title copy];
    copy.titleId = [self.titleId copy];
    copy.visitId = [self.visitId copy];

    return copy;
}
@end
