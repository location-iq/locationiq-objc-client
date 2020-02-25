#import "OAIMatchingApi.h"
#import "OAIQueryParamCollection.h"
#import "OAIApiClient.h"
#import "OAIDirectionsMatching.h"
#import "OAIError.h"


@interface OAIMatchingApi ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *mutableDefaultHeaders;

@end

@implementation OAIMatchingApi

NSString* kOAIMatchingApiErrorDomain = @"OAIMatchingApiErrorDomain";
NSInteger kOAIMatchingApiMissingParamErrorCode = 234513;

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
/// Matching Service
/// Matching API matches or snaps given GPS points to the road network in the most plausible way.  Please note the request might result multiple sub-traces.  Large jumps in the timestamps (> 60s) or improbable transitions lead to trace splits if a complete matching could not be found. The algorithm might not be able to match all points. Outliers are removed if they can not be matched successfully.
///  @param coordinates String of format {longitude},{latitude};{longitude},{latitude}[;{longitude},{latitude} ...] or polyline({polyline}) or polyline6({polyline6}). polyline follows Google's polyline format with precision 5 
///
///  @param generateHints Adds a Hint to the response which can be used in subsequent requests, see hints parameter. Input Value - true (default), false Format - Base64 String (optional)
///
///  @param approaches Keep waypoints on curb side. Input Value - {approach};{approach}[;{approach} ...] Format - curb or unrestricted (default) (optional)
///
///  @param exclude Additive list of classes to avoid, order does not matter. input Value - {class}[,{class}] Format - A class name determined by the profile or none. (optional)
///
///  @param bearings Limits the search to segments with given bearing in degrees towards true north in clockwise direction. List of positive integer pairs separated by semi-colon and bearings array should be equal to length of coordinate array. Input Value :- {bearing};{bearing}[;{bearing} ...] Bearing follows the following format : bearing {value},{range} integer 0 .. 360,integer 0 .. 180 (optional)
///
///  @param radiuses Limits the search to given radius in meters Radiuses array length should be same as coordinates array, eaach value separated by semi-colon. Input Value - {radius};{radius}[;{radius} ...] Radius has following format :- double >= 0 or unlimited (default) (optional)
///
///  @param steps Returned route steps for each route leg [ true, false (default) ] (optional)
///
///  @param annotations Returns additional metadata for each coordinate along the route geometry.  [ true, false (default), nodes, distance, duration, datasources, weight, speed ] (optional, default to @""false"")
///
///  @param geometries Returned route geometry format (influences overview and per step) [ polyline (default), polyline6, geojson ] (optional, default to @""polyline"")
///
///  @param overview Add overview geometry either full, simplified according to highest zoom level it could be display on, or not at all. [ simplified (default), full, false ] (optional, default to @""simplified"")
///
///  @param timestamps Timestamps for the input locations in seconds since UNIX epoch. Timestamps need to be monotonically increasing. [ {timestamp};{timestamp}[;{timestamp} ...]  integer seconds since UNIX epoch (optional)
///
///  @param gaps Allows the input track splitting based on huge timestamp gaps between points. [ split (default), ignore ] (optional, default to @""split"")
///
///  @param tidy Allows the input track modification to obtain better matching quality for noisy tracks. [ true, false (default) ] (optional, default to @""false"")
///
///  @param waypoints Treats input coordinates indicated by given indices as waypoints in returned Match object. Default is to treat all input coordinates as waypoints. [ {index};{index};{index}... ] (optional)
///
///  @returns OAIDirectionsMatching*
///
-(NSURLSessionTask*) matchingWithCoordinates: (NSString*) coordinates
    generateHints: (NSString*) generateHints
    approaches: (NSString*) approaches
    exclude: (NSString*) exclude
    bearings: (NSString*) bearings
    radiuses: (NSString*) radiuses
    steps: (NSString*) steps
    annotations: (NSString*) annotations
    geometries: (NSString*) geometries
    overview: (NSString*) overview
    timestamps: (NSString*) timestamps
    gaps: (NSString*) gaps
    tidy: (NSString*) tidy
    waypoints: (NSString*) waypoints
    completionHandler: (void (^)(OAIDirectionsMatching* output, NSError* error)) handler {
    // verify the required parameter 'coordinates' is set
    if (coordinates == nil) {
        NSParameterAssert(coordinates);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"coordinates"] };
            NSError* error = [NSError errorWithDomain:kOAIMatchingApiErrorDomain code:kOAIMatchingApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/matching/driving/{coordinates}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (coordinates != nil) {
        pathParams[@"coordinates"] = coordinates;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (generateHints != nil) {
        queryParams[@"generate_hints"] = generateHints;
    }
    if (approaches != nil) {
        queryParams[@"approaches"] = approaches;
    }
    if (exclude != nil) {
        queryParams[@"exclude"] = exclude;
    }
    if (bearings != nil) {
        queryParams[@"bearings"] = bearings;
    }
    if (radiuses != nil) {
        queryParams[@"radiuses"] = radiuses;
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
    if (timestamps != nil) {
        queryParams[@"timestamps"] = timestamps;
    }
    if (gaps != nil) {
        queryParams[@"gaps"] = gaps;
    }
    if (tidy != nil) {
        queryParams[@"tidy"] = tidy;
    }
    if (waypoints != nil) {
        queryParams[@"waypoints"] = waypoints;
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
                              responseType: @"OAIDirectionsMatching*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIDirectionsMatching*)data, error);
                                }
                            }];
}



@end
