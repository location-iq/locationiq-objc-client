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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"houseNumber": @"house_number", @"road": @"road", @"residential": @"residential", @"village": @"village", @"county": @"county", @"state": @"state", @"postcode": @"postcode", @"country": @"country", @"countryCode": @"country_code", @"city": @"city" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"houseNumber", @"road", @"residential", @"village", @"county", @"state", @"postcode", @"country", @"countryCode", @"city"];
  return [optionalProperties containsObject:propertyName];
}

@end
