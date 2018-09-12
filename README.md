# LocationIq

LocationIQ provides flexible enterprise-grade location based solutions. We work with developers, startups and enterprises worldwide serving billions of requests everyday. This page provides an overview of the technical aspects of our API and will help you get started.

This ObjC package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 1.0.0
- Package version: 
- Build package: org.openapitools.codegen.languages.ObjcClientCodegen

## Requirements

The SDK requires [**ARC (Automatic Reference Counting)**](http://stackoverflow.com/questions/7778356/how-to-enable-disable-automatic-reference-counting) to be enabled in the Xcode project.

## Installation & Usage
### Install from Github using [CocoaPods](https://cocoapods.org/)

Add the following to the Podfile:

```ruby
pod 'LocationIq', :git => 'https://github.com/location-iq/locationiq-objc-client.git'
```

To specify a particular branch, append `, :branch => 'branch-name-here'`

To specify a particular commit, append `, :commit => '11aa22'`

### Install from local path using [CocoaPods](https://cocoapods.org/)

Put the SDK under your project folder (e.g. /path/to/objc_project/Vendor/LocationIq) and then add the following to the Podfile:

```ruby
pod 'LocationIq', :path => 'Vendor/LocationIq'
```

### Usage

Import the following:

```objc
#import <LocationIq/OAIApiClient.h>
#import <LocationIq/OAIDefaultConfiguration.h>
// load models
#import <LocationIq/OAIAddress.h>
#import <LocationIq/OAIBalance.h>
#import <LocationIq/OAIDaybalance.h>
#import <LocationIq/OAIError.h>
#import <LocationIq/OAILocation.h>
#import <LocationIq/OAINamedetails.h>
// load API classes for accessing endpoints
#import <LocationIq/OAIBalanceApi.h>
#import <LocationIq/OAIReverseApi.h>
#import <LocationIq/OAISearchApi.h>

```

## Recommendation

It's recommended to create an instance of ApiClient per thread in a multi-threaded environment to avoid any potential issues.

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```objc

OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: key)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"key"];



OAIBalanceApi *apiInstance = [[OAIBalanceApi alloc] init];

[apiInstance balanceWithCompletionHandler: 
              ^(OAIBalance* output, NSError* error) {
                            if (output) {
                                NSLog(@"%@", output);
                            }
                            if (error) {
                                NSLog(@"Error: %@", error);
                            }
                        }];

```

## Documentation for API Endpoints

All URIs are relative to *https://eu1.locationiq.com/v1*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*OAIBalanceApi* | [**balance**](docs/OAIBalanceApi.md#balance) | **GET** /balance.php | 
*OAIReverseApi* | [**reverse**](docs/OAIReverseApi.md#reverse) | **GET** /reverse.php | Reverse Geocoding
*OAISearchApi* | [**search**](docs/OAISearchApi.md#search) | **GET** /search.php | Forward Geocoding


## Documentation For Models

 - [OAIAddress](docs/OAIAddress.md)
 - [OAIBalance](docs/OAIBalance.md)
 - [OAIDaybalance](docs/OAIDaybalance.md)
 - [OAIError](docs/OAIError.md)
 - [OAILocation](docs/OAILocation.md)
 - [OAINamedetails](docs/OAINamedetails.md)


## Documentation For Authorization


## key

- **Type**: API key
- **API key parameter name**: key
- **Location**: URL query string


## Author




