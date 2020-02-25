# OAIMatchingApi

All URIs are relative to *https://eu1.locationiq.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**matching**](OAIMatchingApi.md#matching) | **GET** /matching/driving/{coordinates} | Matching Service


# **matching**
```objc
-(NSURLSessionTask*) matchingWithCoordinates: (NSString*) coordinates
    generateHints: (NSString*) generateHints
    approaches: (NSString*) approaches
    exclude: (NSString*) exclude
    bearings: (NSString*) bearings
    radiuses: (NSString*) radiuses
    steps: (NSString*) steps
    annotations: (NSString*) annotations
    geometries: (NSString*) geometries
    overview: (NSString*) overview
    timestamps: (NSString*) timestamps
    gaps: (NSString*) gaps
    tidy: (NSString*) tidy
    waypoints: (NSString*) waypoints
        completionHandler: (void (^)(OAIDirectionsMatching* output, NSError* error)) handler;
```

Matching Service

Matching API matches or snaps given GPS points to the road network in the most plausible way.  Please note the request might result multiple sub-traces.  Large jumps in the timestamps (> 60s) or improbable transitions lead to trace splits if a complete matching could not be found. The algorithm might not be able to match all points. Outliers are removed if they can not be matched successfully.

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: key)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"key"];


NSString* coordinates = "-0.16102,51.523854;-0.15797,51.52326;-0.161593,51.522550"; // String of format {longitude},{latitude};{longitude},{latitude}[;{longitude},{latitude} ...] or polyline({polyline}) or polyline6({polyline6}). polyline follows Google's polyline format with precision 5
NSString* generateHints = "false"; // Adds a Hint to the response which can be used in subsequent requests, see hints parameter. Input Value - true (default), false Format - Base64 String (optional)
NSString* approaches = "curb;curb;curb"; // Keep waypoints on curb side. Input Value - {approach};{approach}[;{approach} ...] Format - curb or unrestricted (default) (optional)
NSString* exclude = "toll"; // Additive list of classes to avoid, order does not matter. input Value - {class}[,{class}] Format - A class name determined by the profile or none. (optional)
NSString* bearings = "None"; // Limits the search to segments with given bearing in degrees towards true north in clockwise direction. List of positive integer pairs separated by semi-colon and bearings array should be equal to length of coordinate array. Input Value :- {bearing};{bearing}[;{bearing} ...] Bearing follows the following format : bearing {value},{range} integer 0 .. 360,integer 0 .. 180 (optional)
NSString* radiuses = "None"; // Limits the search to given radius in meters Radiuses array length should be same as coordinates array, eaach value separated by semi-colon. Input Value - {radius};{radius}[;{radius} ...] Radius has following format :- double >= 0 or unlimited (default) (optional)
NSString* steps = "true"; // Returned route steps for each route leg [ true, false (default) ] (optional)
NSString* annotations = "false"; // Returns additional metadata for each coordinate along the route geometry.  [ true, false (default), nodes, distance, duration, datasources, weight, speed ] (optional) (default to @""false"")
NSString* geometries = "polyline"; // Returned route geometry format (influences overview and per step) [ polyline (default), polyline6, geojson ] (optional) (default to @""polyline"")
NSString* overview = "simplified"; // Add overview geometry either full, simplified according to highest zoom level it could be display on, or not at all. [ simplified (default), full, false ] (optional) (default to @""simplified"")
NSString* timestamps = "200;300;900"; // Timestamps for the input locations in seconds since UNIX epoch. Timestamps need to be monotonically increasing. [ {timestamp};{timestamp}[;{timestamp} ...]  integer seconds since UNIX epoch (optional)
NSString* gaps = "ignore"; // Allows the input track splitting based on huge timestamp gaps between points. [ split (default), ignore ] (optional) (default to @""split"")
NSString* tidy = "false"; // Allows the input track modification to obtain better matching quality for noisy tracks. [ true, false (default) ] (optional) (default to @""false"")
NSString* waypoints = "0;1;2"; // Treats input coordinates indicated by given indices as waypoints in returned Match object. Default is to treat all input coordinates as waypoints. [ {index};{index};{index}... ] (optional)

OAIMatchingApi*apiInstance = [[OAIMatchingApi alloc] init];

// Matching Service
[apiInstance matchingWithCoordinates:coordinates
              generateHints:generateHints
              approaches:approaches
              exclude:exclude
              bearings:bearings
              radiuses:radiuses
              steps:steps
              annotations:annotations
              geometries:geometries
              overview:overview
              timestamps:timestamps
              gaps:gaps
              tidy:tidy
              waypoints:waypoints
          completionHandler: ^(OAIDirectionsMatching* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIMatchingApi->matching: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **coordinates** | **NSString***| String of format {longitude},{latitude};{longitude},{latitude}[;{longitude},{latitude} ...] or polyline({polyline}) or polyline6({polyline6}). polyline follows Google&#39;s polyline format with precision 5 | 
 **generateHints** | **NSString***| Adds a Hint to the response which can be used in subsequent requests, see hints parameter. Input Value - true (default), false Format - Base64 String | [optional] 
 **approaches** | **NSString***| Keep waypoints on curb side. Input Value - {approach};{approach}[;{approach} ...] Format - curb or unrestricted (default) | [optional] 
 **exclude** | **NSString***| Additive list of classes to avoid, order does not matter. input Value - {class}[,{class}] Format - A class name determined by the profile or none. | [optional] 
 **bearings** | **NSString***| Limits the search to segments with given bearing in degrees towards true north in clockwise direction. List of positive integer pairs separated by semi-colon and bearings array should be equal to length of coordinate array. Input Value :- {bearing};{bearing}[;{bearing} ...] Bearing follows the following format : bearing {value},{range} integer 0 .. 360,integer 0 .. 180 | [optional] 
 **radiuses** | **NSString***| Limits the search to given radius in meters Radiuses array length should be same as coordinates array, eaach value separated by semi-colon. Input Value - {radius};{radius}[;{radius} ...] Radius has following format :- double &gt;&#x3D; 0 or unlimited (default) | [optional] 
 **steps** | **NSString***| Returned route steps for each route leg [ true, false (default) ] | [optional] 
 **annotations** | **NSString***| Returns additional metadata for each coordinate along the route geometry.  [ true, false (default), nodes, distance, duration, datasources, weight, speed ] | [optional] [default to @&quot;&quot;false&quot;&quot;]
 **geometries** | **NSString***| Returned route geometry format (influences overview and per step) [ polyline (default), polyline6, geojson ] | [optional] [default to @&quot;&quot;polyline&quot;&quot;]
 **overview** | **NSString***| Add overview geometry either full, simplified according to highest zoom level it could be display on, or not at all. [ simplified (default), full, false ] | [optional] [default to @&quot;&quot;simplified&quot;&quot;]
 **timestamps** | **NSString***| Timestamps for the input locations in seconds since UNIX epoch. Timestamps need to be monotonically increasing. [ {timestamp};{timestamp}[;{timestamp} ...]  integer seconds since UNIX epoch | [optional] 
 **gaps** | **NSString***| Allows the input track splitting based on huge timestamp gaps between points. [ split (default), ignore ] | [optional] [default to @&quot;&quot;split&quot;&quot;]
 **tidy** | **NSString***| Allows the input track modification to obtain better matching quality for noisy tracks. [ true, false (default) ] | [optional] [default to @&quot;&quot;false&quot;&quot;]
 **waypoints** | **NSString***| Treats input coordinates indicated by given indices as waypoints in returned Match object. Default is to treat all input coordinates as waypoints. [ {index};{index};{index}... ] | [optional] 

### Return type

[**OAIDirectionsMatching***](OAIDirectionsMatching.md)

### Authorization

[key](../README.md#key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

