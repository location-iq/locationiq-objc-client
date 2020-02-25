#import "OAIMatrixApi.h"
#import "OAIQueryParamCollection.h"
#import "OAIApiClient.h"
#import "OAIDirectionsMatrix.h"
#import "OAIError.h"


@interface OAIMatrixApi ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *mutableDefaultHeaders;

@end

@implementation OAIMatrixApi

NSString* kOAIMatrixApiErrorDomain = @"OAIMatrixApiErrorDomain";
NSInteger kOAIMatrixApiMissingParamErrorCode = 234513;

@synthesize apiClient = _apiClient;

#pragma mark - Initialize methods

- (instancetype) init {
    return [self initWithApiClient:[OAIApiClient sharedClient]];
}


-(instancetype) initWithApiClient:(OAIApiClient *)apiClient {
    self = [super init];
    if (self) {
        _apiClient = apiClient;
        _mutableDefaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

-(NSString*) defaultHeaderForKey:(NSString*)key {
    return self.mutableDefaultHeaders[key];
}

-(void) setDefaultHeaderValue:(NSString*) value forKey:(NSString*)key {
    [self.mutableDefaultHeaders setValue:value forKey:key];
}

-(NSDictionary *)defaultHeaders {
    return self.mutableDefaultHeaders;
}

#pragma mark - Api Methods

///
/// Matrix Service
/// Computes duration of the fastest route between all pairs of supplied coordinates. Returns the durations or distances or both between the coordinate pairs. Note that the distances are not the shortest distance between two coordinates, but rather the distances of the fastest routes.
///  @param coordinates String of format {longitude},{latitude};{longitude},{latitude}[;{longitude},{latitude} ...] or polyline({polyline}) or polyline6({polyline6}). polyline follows Google's polyline format with precision 5 
///
///  @param bearings Limits the search to segments with given bearing in degrees towards true north in clockwise direction. List of positive integer pairs separated by semi-colon and bearings array should be equal to length of coordinate array. Input Value :- {bearing};{bearing}[;{bearing} ...] Bearing follows the following format : bearing {value},{range} integer 0 .. 360,integer 0 .. 180 (optional)
///
///  @param radiuses Limits the search to given radius in meters Radiuses array length should be same as coordinates array, eaach value separated by semi-colon. Input Value - {radius};{radius}[;{radius} ...] Radius has following format :- double >= 0 or unlimited (default) (optional)
///
///  @param generateHints Adds a Hint to the response which can be used in subsequent requests, see hints parameter. Input Value - true (default), false Format - Base64 String (optional)
///
///  @param approaches Keep waypoints on curb side. Input Value - {approach};{approach}[;{approach} ...] Format - curb or unrestricted (default) (optional)
///
///  @param exclude Additive list of classes to avoid, order does not matter. input Value - {class}[,{class}] Format - A class name determined by the profile or none. (optional)
///
///  @param annotations Returns additional metadata for each coordinate along the route geometry.  [ true, false (default), nodes, distance, duration, datasources, weight, speed ] (optional)
///
///  @param sources Use location with given index as source. [ {index};{index}[;{index} ...] or all (default) ] => index  0 <= integer < #locations (optional)
///
///  @param destinations Use location with given index as destination. [ {index};{index}[;{index} ...] or all (default) ] (optional)
///
///  @param fallbackSpeed If no route found between a source/destination pair, calculate the as-the-crow-flies distance,  then use this speed to estimate duration. double > 0 (optional)
///
///  @param fallbackCoordinate When using a fallback_speed, use the user-supplied coordinate (input), or the snapped location (snapped) for calculating distances. [ input (default), or snapped ] (optional, default to @""input"")
///
///  @returns OAIDirectionsMatrix*
///
-(NSURLSessionTask*) matrixWithCoordinates: (NSString*) coordinates
    bearings: (NSString*) bearings
    radiuses: (NSString*) radiuses
    generateHints: (NSString*) generateHints
    approaches: (NSString*) approaches
    exclude: (NSString*) exclude
    annotations: (NSString*) annotations
    sources: (NSNumber*) sources
    destinations: (NSNumber*) destinations
    fallbackSpeed: (NSNumber*) fallbackSpeed
    fallbackCoordinate: (NSString*) fallbackCoordinate
    completionHandler: (void (^)(OAIDirectionsMatrix* output, NSError* error)) handler {
    // verify the required parameter 'coordinates' is set
    if (coordinates == nil) {
        NSParameterAssert(coordinates);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"coordinates"] };
            NSError* error = [NSError errorWithDomain:kOAIMatrixApiErrorDomain code:kOAIMatrixApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/matrix/driving/{coordinates}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (coordinates != nil) {
        pathParams[@"coordinates"] = coordinates;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (bearings != nil) {
        queryParams[@"bearings"] = bearings;
    }
    if (radiuses != nil) {
        queryParams[@"radiuses"] = radiuses;
    }
    if (generateHints != nil) {
        queryParams[@"generate_hints"] = generateHints;
    }
    if (approaches != nil) {
        queryParams[@"approaches"] = approaches;
    }
    if (exclude != nil) {
        queryParams[@"exclude"] = exclude;
    }
    if (annotations != nil) {
        queryParams[@"annotations"] = annotations;
    }
    if (sources != nil) {
        queryParams[@"sources"] = sources;
    }
    if (destinations != nil) {
        queryParams[@"destinations"] = destinations;
    }
    if (fallbackSpeed != nil) {
        queryParams[@"fallback_speed"] = fallbackSpeed;
    }
    if (fallbackCoordinate != nil) {
        queryParams[@"fallback_coordinate"] = fallbackCoordinate;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"key"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"OAIDirectionsMatrix*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIDirectionsMatrix*)data, error);
                                }
                            }];
}



@end
