#import "OAIAddress.h"

@implementation OAIAddress

- (instancetype)init {
  self = [super init];
  if (self) {
    // initialize property's default value, if any
    
  }
  return self;
}


/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper {
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"houseNumber": @"house_number", @"road": @"road", @"residential": @"residential", @"borough": @"borough", @"neighbourhood": @"neighbourhood", @"quarter": @"quarter", @"hamlet": @"hamlet", @"suburb": @"suburb", @"island": @"island", @"village": @"village", @"town": @"town", @"city": @"city", @"cityDistrict": @"city_district", @"county": @"county", @"state": @"state", @"stateDistrict": @"state_district", @"postcode": @"postcode", @"country": @"country", @"countryCode": @"country_code", @"stateCode": @"state_code" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"houseNumber", @"road", @"residential", @"borough", @"neighbourhood", @"quarter", @"hamlet", @"suburb", @"island", @"village", @"town", @"city", @"cityDistrict", @"county", @"state", @"stateDistrict", @"postcode", @"country", @"countryCode", @"stateCode"];
  return [optionalProperties containsObject:propertyName];
}

@end
