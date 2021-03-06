#import <Foundation/Foundation.h>
#import "OAIError.h"
#import "OAILocation.h"
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



@interface OAISearchApi: NSObject <OAIApi>

extern NSString* kOAISearchApiErrorDomain;
extern NSInteger kOAISearchApiMissingParamErrorCode;

-(instancetype) initWithApiClient:(OAIApiClient *)apiClient NS_DESIGNATED_INITIALIZER;

/// Forward Geocoding
/// The Search API allows converting addresses, such as a street address, into geographic coordinates (latitude and longitude). These coordinates can serve various use-cases, from placing markers on a map to helping algorithms determine nearby bus stops. This process is also known as Forward Geocoding.
///
/// @param q Address to geocode
/// @param format Format to geocode. Only JSON supported for SDKs
/// @param normalizecity For responses with no city value in the address section, the next available element in this order - city_district, locality, town, borough, municipality, village, hamlet, quarter, neighbourhood - from the address section will be normalized to city. Defaults to 1 for SDKs.
/// @param addressdetails Include a breakdown of the address into elements. Defaults to 0. (optional)
/// @param viewbox The preferred area to find search results.  To restrict results to those within the viewbox, use along with the bounded option. Tuple of 4 floats. Any two corner points of the box - &#x60;max_lon,max_lat,min_lon,min_lat&#x60; or &#x60;min_lon,min_lat,max_lon,max_lat&#x60; - are accepted in any order as long as they span a real box.  (optional)
/// @param bounded Restrict the results to only items contained with the viewbox (optional)
/// @param limit Limit the number of returned results. Default is 10. (optional) (default to @10)
/// @param acceptLanguage Preferred language order for showing search results, overrides the value specified in the Accept-Language HTTP header. Defaults to en. To use native language for the response when available, use accept-language&#x3D;native (optional)
/// @param countrycodes Limit search to a list of countries. (optional)
/// @param namedetails Include a list of alternative names in the results. These may include language variants, references, operator and brand. (optional)
/// @param dedupe Sometimes you have several objects in OSM identifying the same place or object in reality. The simplest case is a street being split in many different OSM ways due to different characteristics. Nominatim will attempt to detect such duplicates and only return one match; this is controlled by the dedupe parameter which defaults to 1. Since the limit is, for reasons of efficiency, enforced before and not after de-duplicating, it is possible that de-duplicating leaves you with less results than requested. (optional)
/// @param extratags Include additional information in the result if available, e.g. wikipedia link, opening hours. (optional)
/// @param statecode Adds state or province code when available to the statecode key inside the address element. Currently supported for addresses in the USA, Canada and Australia. Defaults to 0 (optional)
/// @param matchquality Returns additional information about quality of the result in a matchquality object. Read more Defaults to 0 [0,1] (optional)
/// @param postaladdress Returns address inside the postaladdress key, that is specifically formatted for each country. Currently supported for addresses in Germany. Defaults to 0 [0,1] (optional)
/// 
///  code:200 message:"OK",
///  code:400 message:"Bad Request",
///  code:401 message:"Unauthorized",
///  code:403 message:"The request has been made from an unauthorized domain.",
///  code:404 message:"No location or places were found for the given input",
///  code:429 message:"Request exceeded the rate-limits set on your account",
///  code:500 message:"Internal Server Error"
///
/// @return NSArray<OAILocation>*
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
    statecode: (NSNumber*) statecode
    matchquality: (NSNumber*) matchquality
    postaladdress: (NSNumber*) postaladdress
    completionHandler: (void (^)(NSArray<OAILocation>* output, NSError* error)) handler;



@end
