#import "OAINearestApi.h"
#import "OAIQueryParamCollection.h"
#import "OAIApiClient.h"
#import "OAIDirectionsNearest.h"
#import "OAIError.h"


@interface OAINearestApi ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *mutableDefaultHeaders;

@end

@implementation OAINearestApi

NSString* kOAINearestApiErrorDomain = @"OAINearestApiErrorDomain";
NSInteger kOAINearestApiMissingParamErrorCode = 234513;

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
/// Nearest Service
/// Snaps a coordinate to the street network and returns the nearest n matches. Where coordinates only supports a single {longitude},{latitude} entry.
///  @param coordinates String of format {longitude},{latitude};{longitude},{latitude}[;{longitude},{latitude} ...] or polyline({polyline}) or polyline6({polyline6}). polyline follows Google's polyline format with precision 5 
///
///  @param generateHints Adds a Hint to the response which can be used in subsequent requests, see hints parameter. Input Value - true (default), false Format - Base64 String (optional)
///
///  @param exclude Additive list of classes to avoid, order does not matter. input Value - {class}[,{class}] Format - A class name determined by the profile or none. (optional)
///
///  @param bearings Limits the search to segments with given bearing in degrees towards true north in clockwise direction. List of positive integer pairs separated by semi-colon and bearings array should be equal to length of coordinate array. Input Value :- {bearing};{bearing}[;{bearing} ...] Bearing follows the following format : bearing {value},{range} integer 0 .. 360,integer 0 .. 180 (optional)
///
///  @param radiuses Limits the search to given radius in meters Radiuses array length should be same as coordinates array, eaach value separated by semi-colon. Input Value - {radius};{radius}[;{radius} ...] Radius has following format :- double >= 0 or unlimited (default) (optional)
///
///  @param approaches Keep waypoints on curb side. Input Value - {approach};{approach}[;{approach} ...] Format - curb or unrestricted (default) (optional)
///
///  @param number Number of nearest segments that should be returned. [ integer >= 1 (default 1) ] (optional)
///
///  @returns OAIDirectionsNearest*
///
-(NSURLSessionTask*) nearestWithCoordinates: (NSString*) coordinates
    generateHints: (NSString*) generateHints
    exclude: (NSString*) exclude
    bearings: (NSString*) bearings
    radiuses: (NSString*) radiuses
    approaches: (NSString*) approaches
    number: (NSNumber*) number
    completionHandler: (void (^)(OAIDirectionsNearest* output, NSError* error)) handler {
    // verify the required parameter 'coordinates' is set
    if (coordinates == nil) {
        NSParameterAssert(coordinates);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"coordinates"] };
            NSError* error = [NSError errorWithDomain:kOAINearestApiErrorDomain code:kOAINearestApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/nearest/driving/{coordinates}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (coordinates != nil) {
        pathParams[@"coordinates"] = coordinates;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (generateHints != nil) {
        queryParams[@"generate_hints"] = generateHints;
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
    if (approaches != nil) {
        queryParams[@"approaches"] = approaches;
    }
    if (number != nil) {
        queryParams[@"number"] = number;
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
                              responseType: @"OAIDirectionsNearest*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIDirectionsNearest*)data, error);
                                }
                            }];
}



@end
