# OAIReverseApi

All URIs are relative to *https://eu1.locationiq.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**reverse**](OAIReverseApi.md#reverse) | **GET** /reverse.php | Reverse Geocoding


# **reverse**
```objc
-(NSURLSessionTask*) reverseWithLat: (NSNumber*) lat
    lon: (NSNumber*) lon
    format: (NSString*) format
    normalizecity: (NSNumber*) normalizecity
    addressdetails: (NSNumber*) addressdetails
    acceptLanguage: (NSString*) acceptLanguage
    namedetails: (NSNumber*) namedetails
    extratags: (NSNumber*) extratags
    statecode: (NSNumber*) statecode
    showdistance: (NSNumber*) showdistance
    postaladdress: (NSNumber*) postaladdress
        completionHandler: (void (^)(OAILocation* output, NSError* error)) handler;
```

Reverse Geocoding

Reverse geocoding is the process of converting a coordinate or location (latitude, longitude) to a readable address or place name. This permits the identification of nearby street addresses, places, and/or area subdivisions such as a neighborhood, county, state, or country.

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: key)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"key"];


NSNumber* lat = 40.7487727; // Latitude of the location to generate an address for.
NSNumber* lon = -73.9849336; // Longitude of the location to generate an address for.
NSString* format = "json"; // Format to geocode. Only JSON supported for SDKs
NSNumber* normalizecity = 1; // Normalizes village to city level data to city
NSNumber* addressdetails = 1; // Include a breakdown of the address into elements. Defaults to 1. (optional) (default to @1)
NSString* acceptLanguage = "en"; // Preferred language order for showing search results, overrides the value specified in the Accept-Language HTTP header. Defaults to en. To use native language for the response when available, use accept-language=native (optional)
NSNumber* namedetails = 0; // Include a list of alternative names in the results. These may include language variants, references, operator and brand. (optional)
NSNumber* extratags = 0; // Include additional information in the result if available, e.g. wikipedia link, opening hours. (optional)
NSNumber* statecode = 0; // Adds state or province code when available to the statecode key inside the address element. Currently supported for addresses in the USA, Canada and Australia. Defaults to 0 (optional)
NSNumber* showdistance = 0; // Returns the straight line distance (meters) between the input location and the result's location. Value is set in the distance key of the response. Defaults to 0 [0,1] (optional)
NSNumber* postaladdress = 0; // Returns address inside the postaladdress key, that is specifically formatted for each country. Currently supported for addresses in Germany. Defaults to 0 [0,1] (optional)

OAIReverseApi*apiInstance = [[OAIReverseApi alloc] init];

// Reverse Geocoding
[apiInstance reverseWithLat:lat
              lon:lon
              format:format
              normalizecity:normalizecity
              addressdetails:addressdetails
              acceptLanguage:acceptLanguage
              namedetails:namedetails
              extratags:extratags
              statecode:statecode
              showdistance:showdistance
              postaladdress:postaladdress
          completionHandler: ^(OAILocation* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIReverseApi->reverse: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lat** | **NSNumber***| Latitude of the location to generate an address for. | 
 **lon** | **NSNumber***| Longitude of the location to generate an address for. | 
 **format** | **NSString***| Format to geocode. Only JSON supported for SDKs | 
 **normalizecity** | **NSNumber***| Normalizes village to city level data to city | 
 **addressdetails** | **NSNumber***| Include a breakdown of the address into elements. Defaults to 1. | [optional] [default to @1]
 **acceptLanguage** | **NSString***| Preferred language order for showing search results, overrides the value specified in the Accept-Language HTTP header. Defaults to en. To use native language for the response when available, use accept-language&#x3D;native | [optional] 
 **namedetails** | **NSNumber***| Include a list of alternative names in the results. These may include language variants, references, operator and brand. | [optional] 
 **extratags** | **NSNumber***| Include additional information in the result if available, e.g. wikipedia link, opening hours. | [optional] 
 **statecode** | **NSNumber***| Adds state or province code when available to the statecode key inside the address element. Currently supported for addresses in the USA, Canada and Australia. Defaults to 0 | [optional] 
 **showdistance** | **NSNumber***| Returns the straight line distance (meters) between the input location and the result&#39;s location. Value is set in the distance key of the response. Defaults to 0 [0,1] | [optional] 
 **postaladdress** | **NSNumber***| Returns address inside the postaladdress key, that is specifically formatted for each country. Currently supported for addresses in Germany. Defaults to 0 [0,1] | [optional] 

### Return type

[**OAILocation***](OAILocation.md)

### Authorization

[key](../README.md#key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

