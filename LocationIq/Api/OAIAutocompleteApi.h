#import <Foundation/Foundation.h>
#import "OAIError.h"
#import "OAIApi.h"

/**
* LocationIQ
* LocationIQ provides flexible enterprise-grade location based solutions. We work with developers, startups and enterprises worldwide serving billions of requests everyday. This page provides an overview of the technical aspects of our API and will help you get started.
*
* The version of the OpenAPI document: 1.1.0
* 
*
* NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
* https://openapi-generator.tech
* Do not edit the class manually.
*/



@interface OAIAutocompleteApi: NSObject <OAIApi>

extern NSString* kOAIAutocompleteApiErrorDomain;
extern NSInteger kOAIAutocompleteApiMissingParamErrorCode;

-(instancetype) initWithApiClient:(OAIApiClient *)apiClient NS_DESIGNATED_INITIALIZER;

/// 
/// The Autocomplete API is a variant of the Search API that returns place predictions in response to an HTTP request.  The request specifies a textual search string and optional geographic bounds.  The service can be used to provide autocomplete functionality for text-based geographic searches, by returning places such as businesses, addresses and points of interest as a user types. The Autocomplete API can match on full words as well as substrings. Applications can therefore send queries as the user types, to provide on-the-fly place predictions.
///
/// @param q Address to geocode
/// @param normalizecity For responses with no city value in the address section, the next available element in this order - city_district, locality, town, borough, municipality, village, hamlet, quarter, neighbourhood - from the address section will be normalized to city. Defaults to 1 for SDKs.
/// @param limit Limit the number of returned results. Default is 10. (optional) (default to @10)
/// @param viewbox The preferred area to find search results.  To restrict results to those within the viewbox, use along with the bounded option. Tuple of 4 floats. Any two corner points of the box - &#x60;max_lon,max_lat,min_lon,min_lat&#x60; or &#x60;min_lon,min_lat,max_lon,max_lat&#x60; - are accepted in any order as long as they span a real box.  (optional)
/// @param bounded Restrict the results to only items contained with the viewbox (optional)
/// @param countrycodes Limit search to a list of countries. (optional)
/// @param acceptLanguage Preferred language order for showing search results, overrides the value specified in the Accept-Language HTTP header. Defaults to en. To use native language for the response when available, use accept-language&#x3D;native (optional)
/// @param tag Restricts the autocomplete search results to elements of specific OSM class and type.  Example - To restrict results to only class place and type city: tag&#x3D;place:city, To restrict the results to all of OSM class place: tag&#x3D;place (optional)
/// 
///  code:200 message:"OK",
///  code:400 message:"Bad Request",
///  code:401 message:"Unauthorized",
///  code:403 message:"The request has been made from an unauthorized domain.",
///  code:404 message:"No location or places were found for the given input",
///  code:429 message:"Request exceeded the rate-limits set on your account",
///  code:500 message:"Internal Server Error"
///
/// @return NSArray<NSObject*>*
-(NSURLSessionTask*) autocompleteWithQ: (NSString*) q
    normalizecity: (NSNumber*) normalizecity
    limit: (NSNumber*) limit
    viewbox: (NSString*) viewbox
    bounded: (NSNumber*) bounded
    countrycodes: (NSString*) countrycodes
    acceptLanguage: (NSString*) acceptLanguage
    tag: (NSString*) tag
    completionHandler: (void (^)(NSArray<NSObject*>* output, NSError* error)) handler;



@end
