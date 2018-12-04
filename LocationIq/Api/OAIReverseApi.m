#import "OAIReverseApi.h"
#import "OAIQueryParamCollection.h"
#import "OAIApiClient.h"
#import "OAIError.h"
#import "OAILocation.h"


@interface OAIReverseApi ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *mutableDefaultHeaders;

@end

@implementation OAIReverseApi

NSString* kOAIReverseApiErrorDomain = @"OAIReverseApiErrorDomain";
NSInteger kOAIReverseApiMissingParamErrorCode = 234513;

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
/// Reverse Geocoding
/// Reverse geocoding is the process of converting a coordinate or location (latitude, longitude) to a readable address or place name. This permits the identification of nearby street addresses, places, and/or area subdivisions such as a neighborhood, county, state, or country.
///  @param lat Latitude of the location to generate an address for. 
///
///  @param lon Longitude of the location to generate an address for. 
///
///  @param format Format to geocode. Only JSON supported for SDKs 
///
///  @param normalizecity Normalizes village to city level data to city 
///
///  @param addressdetails Include a breakdown of the address into elements. Defaults to 1. (optional, default to @1)
///
///  @param acceptLanguage Preferred language order for showing search results, overrides the value specified in the Accept-Language HTTP header. Defaults to en. To use native language for the response when available, use accept-language=native (optional)
///
///  @param namedetails Include a list of alternative names in the results. These may include language variants, references, operator and brand. (optional)
///
///  @param extratags Include additional information in the result if available, e.g. wikipedia link, opening hours. (optional)
///
///  @param statecode Adds state or province code when available to the statecode key inside the address element. Currently supported for addresses in the USA, Canada and Australia. Defaults to 0 (optional)
///
///  @returns OAILocation*
///
-(NSURLSessionTask*) reverseWithLat: (NSNumber*) lat
    lon: (NSNumber*) lon
    format: (NSString*) format
    normalizecity: (NSNumber*) normalizecity
    addressdetails: (NSNumber*) addressdetails
    acceptLanguage: (NSString*) acceptLanguage
    namedetails: (NSNumber*) namedetails
    extratags: (NSNumber*) extratags
    statecode: (NSNumber*) statecode
    completionHandler: (void (^)(OAILocation* output, NSError* error)) handler {
    // verify the required parameter 'lat' is set
    if (lat == nil) {
        NSParameterAssert(lat);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"lat"] };
            NSError* error = [NSError errorWithDomain:kOAIReverseApiErrorDomain code:kOAIReverseApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'lon' is set
    if (lon == nil) {
        NSParameterAssert(lon);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"lon"] };
            NSError* error = [NSError errorWithDomain:kOAIReverseApiErrorDomain code:kOAIReverseApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'format' is set
    if (format == nil) {
        NSParameterAssert(format);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"format"] };
            NSError* error = [NSError errorWithDomain:kOAIReverseApiErrorDomain code:kOAIReverseApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'normalizecity' is set
    if (normalizecity == nil) {
        NSParameterAssert(normalizecity);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"normalizecity"] };
            NSError* error = [NSError errorWithDomain:kOAIReverseApiErrorDomain code:kOAIReverseApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/reverse.php"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (lat != nil) {
        queryParams[@"lat"] = lat;
    }
    if (lon != nil) {
        queryParams[@"lon"] = lon;
    }
    if (format != nil) {
        queryParams[@"format"] = format;
    }
    if (normalizecity != nil) {
        queryParams[@"normalizecity"] = normalizecity;
    }
    if (addressdetails != nil) {
        queryParams[@"addressdetails"] = addressdetails;
    }
    if (acceptLanguage != nil) {
        queryParams[@"accept-language"] = acceptLanguage;
    }
    if (namedetails != nil) {
        queryParams[@"namedetails"] = namedetails;
    }
    if (extratags != nil) {
        queryParams[@"extratags"] = extratags;
    }
    if (statecode != nil) {
        queryParams[@"statecode"] = statecode;
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
                              responseType: @"OAILocation*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAILocation*)data, error);
                                }
                            }];
}



@end
