#import "OAIDirectionsMatrix.h"

@implementation OAIDirectionsMatrix

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"code": @"code", @"distances": @"distances", @"fallbackSpeedCells": @"fallback_speed_cells", @"sources": @"sources", @"destinations": @"destinations" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"code", @"distances", @"fallbackSpeedCells", @"sources", @"destinations"];
  return [optionalProperties containsObject:propertyName];
}

@end
