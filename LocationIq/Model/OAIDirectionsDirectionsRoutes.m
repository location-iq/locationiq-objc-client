#import "OAIDirectionsDirectionsRoutes.h"

@implementation OAIDirectionsDirectionsRoutes

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"legs": @"legs", @"weightName": @"weight_name", @"geometry": @"geometry", @"weight": @"weight", @"distance": @"distance", @"duration": @"duration" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"legs", @"weightName", @"geometry", @"weight", @"distance", @"duration"];
  return [optionalProperties containsObject:propertyName];
}

@end
