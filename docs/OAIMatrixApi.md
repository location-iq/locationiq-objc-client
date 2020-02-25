# OAIMatrixApi

All URIs are relative to *https://eu1.locationiq.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**matrix**](OAIMatrixApi.md#matrix) | **GET** /matrix/driving/{coordinates} | Matrix Service


# **matrix**
```objc
-(NSURLSessionTask*) matrixWithCoordinates: (NSString*) coordinates
    bearings: (NSString*) bearings
    radiuses: (NSString*) radiuses
    generateHints: (NSString*) generateHints
    approaches: (NSString*) approaches
    exclude: (NSString*) exclude
    annotations: (NSString*) annotations
    sources: (NSNumber*) sources
    destinations: (NSNumber*) destinations
    fallbackSpeed: (NSNumber*) fallbackSpeed
    fallbackCoordinate: (NSString*) fallbackCoordinate
        completionHandler: (void (^)(OAIDirectionsMatrix* output, NSError* error)) handler;
```

Matrix Service

Computes duration of the fastest route between all pairs of supplied coordinates. Returns the durations or distances or both between the coordinate pairs. Note that the distances are not the shortest distance between two coordinates, but rather the distances of the fastest routes.

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
NSString* annotations = "distance"; // Returns additional metadata for each coordinate along the route geometry.  [ true, false (default), nodes, distance, duration, datasources, weight, speed ] (optional)
NSNumber* sources = 0; // Use location with given index as source. [ {index};{index}[;{index} ...] or all (default) ] => index  0 <= integer < #locations (optional)
NSNumber* destinations = 2; // Use location with given index as destination. [ {index};{index}[;{index} ...] or all (default) ] (optional)
NSNumber* fallbackSpeed = 25.65; // If no route found between a source/destination pair, calculate the as-the-crow-flies distance,  then use this speed to estimate duration. double > 0 (optional)
NSString* fallbackCoordinate = "snapped"; // When using a fallback_speed, use the user-supplied coordinate (input), or the snapped location (snapped) for calculating distances. [ input (default), or snapped ] (optional) (default to @""input"")

OAIMatrixApi*apiInstance = [[OAIMatrixApi alloc] init];

// Matrix Service
[apiInstance matrixWithCoordinates:coordinates
              bearings:bearings
              radiuses:radiuses
              generateHints:generateHints
              approaches:approaches
              exclude:exclude
              annotations:annotations
              sources:sources
              destinations:destinations
              fallbackSpeed:fallbackSpeed
              fallbackCoordinate:fallbackCoordinate
          completionHandler: ^(OAIDirectionsMatrix* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIMatrixApi->matrix: %@", error);
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
 **annotations** | **NSString***| Returns additional metadata for each coordinate along the route geometry.  [ true, false (default), nodes, distance, duration, datasources, weight, speed ] | [optional] 
 **sources** | **NSNumber***| Use location with given index as source. [ {index};{index}[;{index} ...] or all (default) ] &#x3D;&gt; index  0 &lt;&#x3D; integer &lt; #locations | [optional] 
 **destinations** | **NSNumber***| Use location with given index as destination. [ {index};{index}[;{index} ...] or all (default) ] | [optional] 
 **fallbackSpeed** | **NSNumber***| If no route found between a source/destination pair, calculate the as-the-crow-flies distance,  then use this speed to estimate duration. double &gt; 0 | [optional] 
 **fallbackCoordinate** | **NSString***| When using a fallback_speed, use the user-supplied coordinate (input), or the snapped location (snapped) for calculating distances. [ input (default), or snapped ] | [optional] [default to @&quot;&quot;input&quot;&quot;]

### Return type

[**OAIDirectionsMatrix***](OAIDirectionsMatrix.md)

### Authorization

[key](../README.md#key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

