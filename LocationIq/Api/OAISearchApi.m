#import "OAISearchApi.h"
#import "OAIQueryParamCollection.h"
#import "OAIApiClient.h"
#import "OAIError.h"
#import "OAILocation.h"


@interface OAISearchApi ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *mutableDefaultHeaders;

@end

@implementation OAISearchApi

NSString* kOAISearchApiErrorDomain = @"OAISearchApiErrorDomain";
NSInteger kOAISearchApiMissingParamErrorCode = 234513;

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
/// Forward Geocoding
/// The Search API allows converting addresses, such as a street address, into geographic coordinates (latitude and longitude). These coordinates can serve various use-cases, from placing markers on a map to helping algorithms determine nearby bus stops. This process is also known as Forward Geocoding.
///  @param q Address to geocode 
///
///  @param format Format to geocode. Only JSON supported for SDKs 
///
///  @param normalizecity For responses with no city value in the address section, the next available element in this order - city_district, locality, town, borough, municipality, village, hamlet, quarter, neighbourhood - from the address section will be normalized to city. Defaults to 1 for SDKs. 
///
///  @param addressdetails Include a breakdown of the address into elements. Defaults to 0. (optional)
///
///  @param viewbox The preferred area to find search results.  To restrict results to those within the viewbox, use along with the bounded option. (optional)
///
///  @param bounded Restrict the results to only items contained with the viewbox (optional)
///
///  @param limit Limit the number of returned results. Default is 10. (optional, default to @10)
///
///  @param acceptLanguage Preferred language order for showing search results, overrides the value specified in the Accept-Language HTTP header. Defaults to en. To use native language for the response when available, use accept-language=native (optional)
///
///  @param countrycodes Limit search to a list of countries. (optional)
///
///  @param namedetails Include a list of alternative names in the results. These may include language variants, references, operator and brand. (optional)
///
///  @param dedupe Sometimes you have several objects in OSM identifying the same place or object in reality. The simplest case is a street being split in many different OSM ways due to different characteristics. Nominatim will attempt to detect such duplicates and only return one match; this is controlled by the dedupe parameter which defaults to 1. Since the limit is, for reasons of efficiency, enforced before and not after de-duplicating, it is possible that de-duplicating leaves you with less results than requested. (optional)
///
///  @param extratags Include additional information in the result if available, e.g. wikipedia link, opening hours. (optional)
///
///  @returns NSArray<OAILocation>*
///
-(NSURLSessionTask*) searchWithQ: (NSString*) q
    format: (NSString*) format
    normalizecity: (NSNumber*) normalizecity
    addressdetails: (NSNumber*) addressdetails
    viewbox: (NSString*) viewbox
    bounded: (NSNumber*) bounded
    limit: (NSNumber*) limit
    acceptLanguage: (NSString*) acceptLanguage
    countrycodes: (NSString*) countrycodes
    namedetails: (NSNumber*) namedetails
    dedupe: (NSNumber*) dedupe
    extratags: (NSNumber*) extratags
    completionHandler: (void (^)(NSArray<OAILocation>* output, NSError* error)) handler {
    // verify the required parameter 'q' is set
    if (q == nil) {
        NSParameterAssert(q);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"q"] };
            NSError* error = [NSError errorWithDomain:kOAISearchApiErrorDomain code:kOAISearchApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'format' is set
    if (format == nil) {
        NSParameterAssert(format);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"format"] };
            NSError* error = [NSError errorWithDomain:kOAISearchApiErrorDomain code:kOAISearchApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'normalizecity' is set
    if (normalizecity == nil) {
        NSParameterAssert(normalizecity);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"normalizecity"] };
            NSError* error = [NSError errorWithDomain:kOAISearchApiErrorDomain code:kOAISearchApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/search.php"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (q != nil) {
        queryParams[@"q"] = q;
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
    if (viewbox != nil) {
        queryParams[@"viewbox"] = viewbox;
    }
    if (bounded != nil) {
        queryParams[@"bounded"] = bounded;
    }
    if (limit != nil) {
        queryParams[@"limit"] = limit;
    }
    if (acceptLanguage != nil) {
        queryParams[@"accept-language"] = acceptLanguage;
    }
    if (countrycodes != nil) {
        queryParams[@"countrycodes"] = countrycodes;
    }
    if (namedetails != nil) {
        queryParams[@"namedetails"] = namedetails;
    }
    if (dedupe != nil) {
        queryParams[@"dedupe"] = dedupe;
    }
    if (extratags != nil) {
        queryParams[@"extratags"] = extratags;
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
                              responseType: @"NSArray<OAILocation>*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((NSArray<OAILocation>*)data, error);
                                }
                            }];
}



@end
