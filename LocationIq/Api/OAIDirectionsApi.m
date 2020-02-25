#import "OAIDirectionsApi.h"
#import "OAIQueryParamCollection.h"
#import "OAIApiClient.h"
#import "OAIDirectionsDirections.h"
#import "OAIError.h"


@interface OAIDirectionsApi ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *mutableDefaultHeaders;

@end

@implementation OAIDirectionsApi

NSString* kOAIDirectionsApiErrorDomain = @"OAIDirectionsApiErrorDomain";
NSInteger kOAIDirectionsApiMissingParamErrorCode = 234513;

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
/// Directions Service
/// Finds the fastest route between coordinates in the supplied order.
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
///  @param alternatives Search for alternative routes. Passing a number alternatives=n searches for up to n alternative routes. [ true, false (default), or Number ] (optional)
///
///  @param steps Returned route steps for each route leg [ true, false (default) ] (optional)
///
///  @param annotations Returns additional metadata for each coordinate along the route geometry.  [ true, false (default), nodes, distance, duration, datasources, weight, speed ] (optional, default to @""false"")
///
///  @param geometries Returned route geometry format (influences overview and per step) [ polyline (default), polyline6, geojson ] (optional, default to @""polyline"")
///
///  @param overview Add overview geometry either full, simplified according to highest zoom level it could be display on, or not at all. [ simplified (default), full, false ] (optional, default to @""simplified"")
///
///  @param continueStraight Forces the route to keep going straight at waypoints constraining uturns there even if it would be faster. Default value depends on the profile [ default (default), true, false ] (optional, default to @""default"")
///
///  @returns OAIDirectionsDirections*
///
-(NSURLSessionTask*) directionsWithCoordinates: (NSString*) coordinates
    bearings: (NSString*) bearings
    radiuses: (NSString*) radiuses
    generateHints: (NSString*) generateHints
    approaches: (NSString*) approaches
    exclude: (NSString*) exclude
    alternatives: (NSNumber*) alternatives
    steps: (NSString*) steps
    annotations: (NSString*) annotations
    geometries: (NSString*) geometries
    overview: (NSString*) overview
    continueStraight: (NSString*) continueStraight
    completionHandler: (void (^)(OAIDirectionsDirections* output, NSError* error)) handler {
    // verify the required parameter 'coordinates' is set
    if (coordinates == nil) {
        NSParameterAssert(coordinates);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"coordinates"] };
            NSError* error = [NSError errorWithDomain:kOAIDirectionsApiErrorDomain code:kOAIDirectionsApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/directions/driving/{coordinates}"];

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
    if (alternatives != nil) {
        queryParams[@"alternatives"] = alternatives;
    }
    if (steps != nil) {
        queryParams[@"steps"] = steps;
    }
    if (annotations != nil) {
        queryParams[@"annotations"] = annotations;
    }
    if (geometries != nil) {
        queryParams[@"geometries"] = geometries;
    }
    if (overview != nil) {
        queryParams[@"overview"] = overview;
    }
    if (continueStraight != nil) {
        queryParams[@"continue_straight"] = continueStraight;
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
                              responseType: @"OAIDirectionsDirections*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIDirectionsDirections*)data, error);
                                }
                            }];
}



@end
