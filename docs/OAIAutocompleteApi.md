# OAIAutocompleteApi

All URIs are relative to *https://eu1.locationiq.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**autocomplete**](OAIAutocompleteApi.md#autocomplete) | **GET** /autocomplete.php | 


# **autocomplete**
```objc
-(NSURLSessionTask*) autocompleteWithQ: (NSString*) q
    normalizecity: (NSNumber*) normalizecity
    limit: (NSNumber*) limit
    viewbox: (NSString*) viewbox
    bounded: (NSNumber*) bounded
    countrycodes: (NSString*) countrycodes
    acceptLanguage: (NSString*) acceptLanguage
    tag: (NSString*) tag
        completionHandler: (void (^)(NSArray<NSObject*>* output, NSError* error)) handler;
```



The Autocomplete API is a variant of the Search API that returns place predictions in response to an HTTP request.  The request specifies a textual search string and optional geographic bounds.  The service can be used to provide autocomplete functionality for text-based geographic searches, by returning places such as businesses, addresses and points of interest as a user types. The Autocomplete API can match on full words as well as substrings. Applications can therefore send queries as the user types, to provide on-the-fly place predictions.

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: key)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"key"];


NSString* q = "Empire state"; // Address to geocode
NSNumber* normalizecity = 1; // For responses with no city value in the address section, the next available element in this order - city_district, locality, town, borough, municipality, village, hamlet, quarter, neighbourhood - from the address section will be normalized to city. Defaults to 1 for SDKs.
NSNumber* limit = 10; // Limit the number of returned results. Default is 10. (optional) (default to @10)
NSString* viewbox = "-132.84908,47.69382,-70.44674,30.82531"; // The preferred area to find search results.  To restrict results to those within the viewbox, use along with the bounded option. Tuple of 4 floats. Any two corner points of the box - `max_lon,max_lat,min_lon,min_lat` or `min_lon,min_lat,max_lon,max_lat` - are accepted in any order as long as they span a real box.  (optional)
NSNumber* bounded = 1; // Restrict the results to only items contained with the viewbox (optional)
NSString* countrycodes = "us"; // Limit search to a list of countries. (optional)
NSString* acceptLanguage = "en"; // Preferred language order for showing search results, overrides the value specified in the Accept-Language HTTP header. Defaults to en. To use native language for the response when available, use accept-language=native (optional)
NSString* tag = "place"; // Restricts the autocomplete search results to elements of specific OSM class and type.  Example - To restrict results to only class place and type city: tag=place:city, To restrict the results to all of OSM class place: tag=place (optional)

OAIAutocompleteApi*apiInstance = [[OAIAutocompleteApi alloc] init];

[apiInstance autocompleteWithQ:q
              normalizecity:normalizecity
              limit:limit
              viewbox:viewbox
              bounded:bounded
              countrycodes:countrycodes
              acceptLanguage:acceptLanguage
              tag:tag
          completionHandler: ^(NSArray<NSObject*>* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIAutocompleteApi->autocomplete: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **q** | **NSString***| Address to geocode | 
 **normalizecity** | **NSNumber***| For responses with no city value in the address section, the next available element in this order - city_district, locality, town, borough, municipality, village, hamlet, quarter, neighbourhood - from the address section will be normalized to city. Defaults to 1 for SDKs. | 
 **limit** | **NSNumber***| Limit the number of returned results. Default is 10. | [optional] [default to @10]
 **viewbox** | **NSString***| The preferred area to find search results.  To restrict results to those within the viewbox, use along with the bounded option. Tuple of 4 floats. Any two corner points of the box - &#x60;max_lon,max_lat,min_lon,min_lat&#x60; or &#x60;min_lon,min_lat,max_lon,max_lat&#x60; - are accepted in any order as long as they span a real box.  | [optional] 
 **bounded** | **NSNumber***| Restrict the results to only items contained with the viewbox | [optional] 
 **countrycodes** | **NSString***| Limit search to a list of countries. | [optional] 
 **acceptLanguage** | **NSString***| Preferred language order for showing search results, overrides the value specified in the Accept-Language HTTP header. Defaults to en. To use native language for the response when available, use accept-language&#x3D;native | [optional] 
 **tag** | **NSString***| Restricts the autocomplete search results to elements of specific OSM class and type.  Example - To restrict results to only class place and type city: tag&#x3D;place:city, To restrict the results to all of OSM class place: tag&#x3D;place | [optional] 

### Return type

**NSArray<NSObject*>***

### Authorization

[key](../README.md#key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

