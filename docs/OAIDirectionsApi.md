# OAIDirectionsApi

All URIs are relative to *https://eu1.locationiq.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**directions**](OAIDirectionsApi.md#directions) | **GET** /directions/driving/{coordinates} | Directions Service


# **directions**
```objc
-(NSURLSessionTask*) directionsWithCoordinates: (NSString*) coordinates
    bearings: (NSString*) bearings
    radiuses: (NSString*) radiuses
    generateHints: (NSString*) generateHints
    approaches: (NSString*) approaches
    exclude: (NSString*) exclude
    alternatives: (NSNumber*) alternatives
    steps: (NSString*) steps
    annotations: (NSString*) annotations
    geometries: (NSString*) geometries
    overview: (NSString*) overview
    continueStraight: (NSString*) continueStraight
        completionHandler: (void (^)(OAIDirectionsDirections* output, NSError* error)) handler;
```

Directions Service

Finds the fastest route between coordinates in the supplied order.

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: key)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"key"];


NSString* coordinates = "-0.16102,51.523854;-0.15797,51.52326;-0.161593,51.522550"; // String of format {longitude},{latitude};{longitude},{latitude}[;{longitude},{latitude} ...] or polyline({polyline}) or polyline6({polyline6}). polyline follows Google's polyline format with precision 5
NSString* bearings = "10,20;40,30;30,9"; // Limits the search to segments with given bearing in degrees towards true north in clockwise direction. List of positive integer pairs separated by semi-colon and bearings array should be equal to length of coordinate array. Input Value :- {bearing};{bearing}[;{bearing} ...] Bearing follows the following format : bearing {value},{range} integer 0 .. 360,integer 0 .. 180 (optional)
NSString* radiuses = "500;200;300"; // Limits the search to given radius in meters Radiuses array length should be same as coordinates array, eaach value separated by semi-colon. Input Value - {radius};{radius}[;{radius} ...] Radius has following format :- double >= 0 or unlimited (default) (optional)
NSString* generateHints = "false"; // Adds a Hint to the response which can be used in subsequent requests, see hints parameter. Input Value - true (default), false Format - Base64 String (optional)
NSString* approaches = "curb;curb;curb"; // Keep waypoints on curb side. Input Value - {approach};{approach}[;{approach} ...] Format - curb or unrestricted (default) (optional)
NSString* exclude = "toll"; // Additive list of classes to avoid, order does not matter. input Value - {class}[,{class}] Format - A class name determined by the profile or none. (optional)
NSNumber* alternatives = 0; // Search for alternative routes. Passing a number alternatives=n searches for up to n alternative routes. [ true, false (default), or Number ] (optional)
NSString* steps = "true"; // Returned route steps for each route leg [ true, false (default) ] (optional)
NSString* annotations = "false"; // Returns additional metadata for each coordinate along the route geometry.  [ true, false (default), nodes, distance, duration, datasources, weight, speed ] (optional) (default to @""false"")
NSString* geometries = "polyline"; // Returned route geometry format (influences overview and per step) [ polyline (default), polyline6, geojson ] (optional) (default to @""polyline"")
NSString* overview = "simplified"; // Add overview geometry either full, simplified according to highest zoom level it could be display on, or not at all. [ simplified (default), full, false ] (optional) (default to @""simplified"")
NSString* continueStraight = "default"; // Forces the route to keep going straight at waypoints constraining uturns there even if it would be faster. Default value depends on the profile [ default (default), true, false ] (optional) (default to @""default"")

OAIDirectionsApi*apiInstance = [[OAIDirectionsApi alloc] init];

// Directions Service
[apiInstance directionsWithCoordinates:coordinates
              bearings:bearings
              radiuses:radiuses
              generateHints:generateHints
              approaches:approaches
              exclude:exclude
              alternatives:alternatives
              steps:steps
              annotations:annotations
              geometries:geometries
              overview:overview
              continueStraight:continueStraight
          completionHandler: ^(OAIDirectionsDirections* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIDirectionsApi->directions: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **coordinates** | **NSString***| String of format {longitude},{latitude};{longitude},{latitude}[;{longitude},{latitude} ...] or polyline({polyline}) or polyline6({polyline6}). polyline follows Google&#39;s polyline format with precision 5 | 
 **bearings** | **NSString***| Limits the search to segments with given bearing in degrees towards true north in clockwise direction. List of positive integer pairs separated by semi-colon and bearings array should be equal to length of coordinate array. Input Value :- {bearing};{bearing}[;{bearing} ...] Bearing follows the following format : bearing {value},{range} integer 0 .. 360,integer 0 .. 180 | [optional] 
 **radiuses** | **NSString***| Limits the search to given radius in meters Radiuses array length should be same as coordinates array, eaach value separated by semi-colon. Input Value - {radius};{radius}[;{radius} ...] Radius has following format :- double &gt;&#x3D; 0 or unlimited (default) | [optional] 
 **generateHints** | **NSString***| Adds a Hint to the response which can be used in subsequent requests, see hints parameter. Input Value - true (default), false Format - Base64 String | [optional] 
 **approaches** | **NSString***| Keep waypoints on curb side. Input Value - {approach};{approach}[;{approach} ...] Format - curb or unrestricted (default) | [optional] 
 **exclude** | **NSString***| Additive list of classes to avoid, order does not matter. input Value - {class}[,{class}] Format - A class name determined by the profile or none. | [optional] 
 **alternatives** | **NSNumber***| Search for alternative routes. Passing a number alternatives&#x3D;n searches for up to n alternative routes. [ true, false (default), or Number ] | [optional] 
 **steps** | **NSString***| Returned route steps for each route leg [ true, false (default) ] | [optional] 
 **annotations** | **NSString***| Returns additional metadata for each coordinate along the route geometry.  [ true, false (default), nodes, distance, duration, datasources, weight, speed ] | [optional] [default to @&quot;&quot;false&quot;&quot;]
 **geometries** | **NSString***| Returned route geometry format (influences overview and per step) [ polyline (default), polyline6, geojson ] | [optional] [default to @&quot;&quot;polyline&quot;&quot;]
 **overview** | **NSString***| Add overview geometry either full, simplified according to highest zoom level it could be display on, or not at all. [ simplified (default), full, false ] | [optional] [default to @&quot;&quot;simplified&quot;&quot;]
 **continueStraight** | **NSString***| Forces the route to keep going straight at waypoints constraining uturns there even if it would be faster. Default value depends on the profile [ default (default), true, false ] | [optional] [default to @&quot;&quot;default&quot;&quot;]

### Return type

[**OAIDirectionsDirections***](OAIDirectionsDirections.md)

### Authorization

[key](../README.md#key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

