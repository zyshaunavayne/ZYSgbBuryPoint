//
//  ZYBuryPointVCInfoModel.m
//  ZYBuryPoint
//
//  Created by 张宇 on 2020/12/9.
//

//
//    ZYBuryPointVCInfoModel.m
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ZYBuryPointVCInfoModel.h"

NSString *const kZYBuryPointVCInfoModelAndroid = @"android";
NSString *const kZYBuryPointVCInfoModelIOS = @"iOS";
NSString *const kZYBuryPointVCInfoModelTitle = @"title";
NSString *const kZYBuryPointVCInfoModelTitleId = @"titleId";

@interface ZYBuryPointVCInfoModel ()
@end
@implementation ZYBuryPointVCInfoModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kZYBuryPointVCInfoModelAndroid] isKindOfClass:[NSNull class]]){
        self.android = dictionary[kZYBuryPointVCInfoModelAndroid];
    }
    if(![dictionary[kZYBuryPointVCInfoModelIOS] isKindOfClass:[NSNull class]]){
        self.iOS = dictionary[kZYBuryPointVCInfoModelIOS];
    }
    if(![dictionary[kZYBuryPointVCInfoModelTitle] isKindOfClass:[NSNull class]]){
        self.title = dictionary[kZYBuryPointVCInfoModelTitle];
    }
    if(![dictionary[kZYBuryPointVCInfoModelTitleId] isKindOfClass:[NSNull class]]){
        self.titleId = dictionary[kZYBuryPointVCInfoModelTitleId];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.android != nil){
        dictionary[kZYBuryPointVCInfoModelAndroid] = self.android;
    }
    if(self.iOS != nil){
        dictionary[kZYBuryPointVCInfoModelIOS] = self.iOS;
    }
    if(self.title != nil){
        dictionary[kZYBuryPointVCInfoModelTitle] = self.title;
    }
    if(self.titleId != nil){
        dictionary[kZYBuryPointVCInfoModelTitleId] = self.titleId;
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
    if(self.android != nil){
        [aCoder encodeObject:self.android forKey:kZYBuryPointVCInfoModelAndroid];
    }
    if(self.iOS != nil){
        [aCoder encodeObject:self.iOS forKey:kZYBuryPointVCInfoModelIOS];
    }
    if(self.title != nil){
        [aCoder encodeObject:self.title forKey:kZYBuryPointVCInfoModelTitle];
    }
    if(self.titleId != nil){
        [aCoder encodeObject:self.titleId forKey:kZYBuryPointVCInfoModelTitleId];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.android = [aDecoder decodeObjectForKey:kZYBuryPointVCInfoModelAndroid];
    self.iOS = [aDecoder decodeObjectForKey:kZYBuryPointVCInfoModelIOS];
    self.title = [aDecoder decodeObjectForKey:kZYBuryPointVCInfoModelTitle];
    self.titleId = [aDecoder decodeObjectForKey:kZYBuryPointVCInfoModelTitleId];
    return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    ZYBuryPointVCInfoModel *copy = [ZYBuryPointVCInfoModel new];

    copy.android = [self.android copy];
    copy.iOS = [self.iOS copy];
    copy.title = [self.title copy];
    copy.titleId = [self.titleId copy];

    return copy;
}
@end
