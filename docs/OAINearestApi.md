# OAINearestApi

All URIs are relative to *https://eu1.locationiq.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**nearest**](OAINearestApi.md#nearest) | **GET** /nearest/driving/{coordinates} | Nearest Service


# **nearest**
```objc
-(NSURLSessionTask*) nearestWithCoordinates: (NSString*) coordinates
    generateHints: (NSString*) generateHints
    exclude: (NSString*) exclude
    bearings: (NSString*) bearings
    radiuses: (NSString*) radiuses
    approaches: (NSString*) approaches
    number: (NSNumber*) number
        completionHandler: (void (^)(OAIDirectionsNearest* output, NSError* error)) handler;
```

Nearest Service

Snaps a coordinate to the street network and returns the nearest n matches. Where coordinates only supports a single {longitude},{latitude} entry.

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: key)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"key"];


NSString* coordinates = "-0.16102,51.523854"; // String of format {longitude},{latitude};{longitude},{latitude}[;{longitude},{latitude} ...] or polyline({polyline}) or polyline6({polyline6}). polyline follows Google's polyline format with precision 5
NSString* generateHints = "false"; // Adds a Hint to the response which can be used in subsequent requests, see hints parameter. Input Value - true (default), false Format - Base64 String (optional)
NSString* exclude = "toll"; // Additive list of classes to avoid, order does not matter. input Value - {class}[,{class}] Format - A class name determined by the profile or none. (optional)
NSString* bearings = "10,20"; // Limits the search to segments with given bearing in degrees towards true north in clockwise direction. List of positive integer pairs separated by semi-colon and bearings array should be equal to length of coordinate array. Input Value :- {bearing};{bearing}[;{bearing} ...] Bearing follows the following format : bearing {value},{range} integer 0 .. 360,integer 0 .. 180 (optional)
NSString* radiuses = "1000"; // Limits the search to given radius in meters Radiuses array length should be same as coordinates array, eaach value separated by semi-colon. Input Value - {radius};{radius}[;{radius} ...] Radius has following format :- double >= 0 or unlimited (default) (optional)
NSString* approaches = "curb"; // Keep waypoints on curb side. Input Value - {approach};{approach}[;{approach} ...] Format - curb or unrestricted (default) (optional)
NSNumber* number = 3; // Number of nearest segments that should be returned. [ integer >= 1 (default 1) ] (optional)

OAINearestApi*apiInstance = [[OAINearestApi alloc] init];

// Nearest Service
[apiInstance nearestWithCoordinates:coordinates
              generateHints:generateHints
              exclude:exclude
              bearings:bearings
              radiuses:radiuses
              approaches:approaches
              number:number
          completionHandler: ^(OAIDirectionsNearest* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAINearestApi->nearest: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **coordinates** | **NSString***| String of format {longitude},{latitude};{longitude},{latitude}[;{longitude},{latitude} ...] or polyline({polyline}) or polyline6({polyline6}). polyline follows Google&#39;s polyline format with precision 5 | 
 **generateHints** | **NSString***| Adds a Hint to the response which can be used in subsequent requests, see hints parameter. Input Value - true (default), false Format - Base64 String | [optional] 
 **exclude** | **NSString***| Additive list of classes to avoid, order does not matter. input Value - {class}[,{class}] Format - A class name determined by the profile or none. | [optional] 
 **bearings** | **NSString***| Limits the search to segments with given bearing in degrees towards true north in clockwise direction. List of positive integer pairs separated by semi-colon and bearings array should be equal to length of coordinate array. Input Value :- {bearing};{bearing}[;{bearing} ...] Bearing follows the following format : bearing {value},{range} integer 0 .. 360,integer 0 .. 180 | [optional] 
 **radiuses** | **NSString***| Limits the search to given radius in meters Radiuses array length should be same as coordinates array, eaach value separated by semi-colon. Input Value - {radius};{radius}[;{radius} ...] Radius has following format :- double &gt;&#x3D; 0 or unlimited (default) | [optional] 
 **approaches** | **NSString***| Keep waypoints on curb side. Input Value - {approach};{approach}[;{approach} ...] Format - curb or unrestricted (default) | [optional] 
 **number** | **NSNumber***| Number of nearest segments that should be returned. [ integer &gt;&#x3D; 1 (default 1) ] | [optional] 

### Return type

[**OAIDirectionsNearest***](OAIDirectionsNearest.md)

### Authorization

[key](../README.md#key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

