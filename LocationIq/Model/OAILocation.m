#import "OAILocation.h"

@implementation OAILocation

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"placeId": @"place_id", @"licence": @"licence", @"osmType": @"osm_type", @"osmId": @"osm_id", @"boundingbox": @"boundingbox", @"lat": @"lat", @"lon": @"lon", @"displayName": @"display_name", @"_class": @"class", @"type": @"type", @"importance": @"importance", @"address": @"address", @"namedetails": @"namedetails" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"placeId", @"licence", @"osmType", @"osmId", @"boundingbox", @"lat", @"lon", @"displayName", @"_class", @"type", @"importance", @"address", @"namedetails"];
  return [optionalProperties containsObject:propertyName];
}

@end
