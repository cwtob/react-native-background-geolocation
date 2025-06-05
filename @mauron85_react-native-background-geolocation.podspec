require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "@mauron85_react-native-background-geolocation"
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.platform     = :ios, "15.1"

  s.source       = { :path => "ios" }
  s.source_files  = "ios/**/*.{m}"
  # s.source_files  = "ios/**/*.{h,m}"
  # s.source_files = "ios/**/*.{mm,swift}", "cpp/**/*.{cpp,c}" # Do not include the headers in the sources, then XCode won't try to compile them

  s.pod_target_xcconfig = {
    # "DEFINES_MODULE" => "YES",
    # "SWIFT_COMPILATION_MODE" => "wholemodule",
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++20",
    "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ios/\"/** " # This will link the headers at compile time, flag passed directly to the compiler
  }

  s.preserve_paths = [
    # "cpp/**/*.h",
    "ios/**/*.h"
  ]

  s.exclude_files = "ios/common/BackgroundGeolocationTests/*.{h,m}"

  s.dependency 'React'
end
