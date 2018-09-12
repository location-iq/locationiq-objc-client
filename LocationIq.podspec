#
# Be sure to run `pod lib lint LocationIq.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = "LocationIq"
    s.version          = "1.0.0"

    s.summary          = "LocationIQ"
    s.description      = <<-DESC
                         LocationIQ provides flexible enterprise-grade location based solutions. We work with developers, startups and enterprises worldwide serving billions of requests everyday. This page provides an overview of the technical aspects of our API and will help you get started.
                         DESC

    s.platform     = :ios, '7.0'
    s.requires_arc = true

    s.framework    = 'SystemConfiguration'

    s.homepage     = "https://github.com/openapitools/openapi-generator"
    s.license      = "Proprietary"
    s.source       = { :git => "https://github.com/openapitools/openapi-generator.git", :tag => "#{s.version}" }
    s.author       = { "OpenAPI" => "team@openapitools.org" }

    s.source_files = 'LocationIq/**/*.{m,h}'
    s.public_header_files = 'LocationIq/**/*.h'


    s.dependency 'AFNetworking', '~> 3'
    s.dependency 'JSONModel', '~> 1.2'
    s.dependency 'ISO8601', '~> 0.6'
end

