# OAISearchApi

All URIs are relative to *https://eu1.locationiq.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**search**](OAISearchApi.md#search) | **GET** /search.php | Forward Geocoding


# **search**
```objc
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
```

Forward Geocoding

The Search API allows converting addresses, such as a street address, into geographic coordinates (latitude and longitude). These coordinates can serve various use-cases, from placing markers on a map to helping algorithms determine nearby bus stops. This process is also known as Forward Geocoding.

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: key)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"key"];


NSString* q = "Empire state building"; // Address to geocode
NSString* format = "json"; // Format to geocode. Only JSON supported for SDKs
NSNumber* normalizecity = 1; // For responses with no city value in the address section, the next available element in this order - city_district, locality, town, borough, municipality, village, hamlet, quarter, neighbourhood - from the address section will be normalized to city. Defaults to 1 for SDKs.
NSNumber* addressdetails = 1; // Include a breakdown of the address into elements. Defaults to 0. (optional)
NSString* viewbox = "-132.84908,47.69382,-70.44674,30.82531"; // The preferred area to find search results.  To restrict results to those within the viewbox, use along with the bounded option. Tuple of 4 floats. Any two corner points of the box - `max_lon,max_lat,min_lon,min_lat` or `min_lon,min_lat,max_lon,max_lat` - are accepted in any order as long as they span a real box.  (optional)
NSNumber* bounded = 1; // Restrict the results to only items contained with the viewbox (optional)
NSNumber* limit = 10; // Limit the number of returned results. Default is 10. (optional) (default to @10)
NSString* acceptLanguage = "en"; // Preferred language order for showing search results, overrides the value specified in the Accept-Language HTTP header. Defaults to en. To use native language for the response when available, use accept-language=native (optional)
NSString* countrycodes = "us"; // Limit search to a list of countries. (optional)
NSNumber* namedetails = 1; // Include a list of alternative names in the results. These may include language variants, references, operator and brand. (optional)
NSNumber* dedupe = 1; // Sometimes you have several objects in OSM identifying the same place or object in reality. The simplest case is a street being split in many different OSM ways due to different characteristics. Nominatim will attempt to detect such duplicates and only return one match; this is controlled by the dedupe parameter which defaults to 1. Since the limit is, for reasons of efficiency, enforced before and not after de-duplicating, it is possible that de-duplicating leaves you with less results than requested. (optional)
NSNumber* extratags = 0; // Include additional information in the result if available, e.g. wikipedia link, opening hours. (optional)
NSNumber* statecode = 0; // Adds state or province code when available to the statecode key inside the address element. Currently supported for addresses in the USA, Canada and Australia. Defaults to 0 (optional)
NSNumber* matchquality = 0; // Returns additional information about quality of the result in a matchquality object. Read more Defaults to 0 [0,1] (optional)
NSNumber* postaladdress = 0; // Returns address inside the postaladdress key, that is specifically formatted for each country. Currently supported for addresses in Germany. Defaults to 0 [0,1] (optional)

OAISearchApi*apiInstance = [[OAISearchApi alloc] init];

// Forward Geocoding
[apiInstance searchWithQ:q
              format:format
              normalizecity:normalizecity
              addressdetails:addressdetails
              viewbox:viewbox
              bounded:bounded
              limit:limit
              acceptLanguage:acceptLanguage
              countrycodes:countrycodes
              namedetails:namedetails
              dedupe:dedupe
              extratags:extratags
              statecode:statecode
              matchquality:matchquality
              postaladdress:postaladdress
          completionHandler: ^(NSArray<OAILocation>* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAISearchApi->search: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **q** | **NSString***| Address to geocode | 
 **format** | **NSString***| Format to geocode. Only JSON supported for SDKs | 
 **normalizecity** | **NSNumber***| For responses with no city value in the address section, the next available element in this order - city_district, locality, town, borough, municipality, village, hamlet, quarter, neighbourhood - from the address section will be normalized to city. Defaults to 1 for SDKs. | 
 **addressdetails** | **NSNumber***| Include a breakdown of the address into elements. Defaults to 0. | [optional] 
 **viewbox** | **NSString***| The preferred area to find search results.  To restrict results to those within the viewbox, use along with the bounded option. Tuple of 4 floats. Any two corner points of the box - &#x60;max_lon,max_lat,min_lon,min_lat&#x60; or &#x60;min_lon,min_lat,max_lon,max_lat&#x60; - are accepted in any order as long as they span a real box.  | [optional] 
 **bounded** | **NSNumber***| Restrict the results to only items contained with the viewbox | [optional] 
 **limit** | **NSNumber***| Limit the number of returned results. Default is 10. | [optional] [default to @10]
 **acceptLanguage** | **NSString***| Preferred language order for showing search results, overrides the value specified in the Accept-Language HTTP header. Defaults to en. To use native language for the response when available, use accept-language&#x3D;native | [optional] 
 **countrycodes** | **NSString***| Limit search to a list of countries. | [optional] 
 **namedetails** | **NSNumber***| Include a list of alternative names in the results. These may include language variants, references, operator and brand. | [optional] 
 **dedupe** | **NSNumber***| Sometimes you have several objects in OSM identifying the same place or object in reality. The simplest case is a street being split in many different OSM ways due to different characteristics. Nominatim will attempt to detect such duplicates and only return one match; this is controlled by the dedupe parameter which defaults to 1. Since the limit is, for reasons of efficiency, enforced before and not after de-duplicating, it is possible that de-duplicating leaves you with less results than requested. | [optional] 
 **extratags** | **NSNumber***| Include additional information in the result if available, e.g. wikipedia link, opening hours. | [optional] 
 **statecode** | **NSNumber***| Adds state or province code when available to the statecode key inside the address element. Currently supported for addresses in the USA, Canada and Australia. Defaults to 0 | [optional] 
 **matchquality** | **NSNumber***| Returns additional information about quality of the result in a matchquality object. Read more Defaults to 0 [0,1] | [optional] 
 **postaladdress** | **NSNumber***| Returns address inside the postaladdress key, that is specifically formatted for each country. Currently supported for addresses in Germany. Defaults to 0 [0,1] | [optional] 

### Return type

[**NSArray<OAILocation>***](OAILocation.md)

### Authorization

[key](../README.md#key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

