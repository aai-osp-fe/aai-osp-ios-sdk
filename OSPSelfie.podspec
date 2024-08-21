#
# Be sure to run `pod lib lint OSPKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OSPSelfie'
  s.version          = 'selfie.1.1.0'
  s.summary          = 'Used for conducting liveness detection.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'The OSPSelfie Inquiry flow lets you securely and seamlessly collect your user\'s information'

  s.homepage         = 'https://github.com/aai-osp-fe/aai-osp-ios-sdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'loong' => 'yulong.chen@advancegroup.com' }
  s.source           = { :git => 'https://github.com/aai-osp-fe/aai-osp-ios-sdk.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
#  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'arm64' }
  s.xcconfig = { 'ARCHS' => 'arm64' }
  s.swift_version    = '5.0'
#  s.pod_target_xcconfig = { 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }
  
  s.source_files = 'OSPKit/Classes/**/*'
  s.vendored_frameworks = ['OSPKit/Frameworks/FaceTecSDK.xcframework',
                           'OSPKit/Frameworks/Selfie.xcframework']
  s.dependency 'PromiseKit'
  s.dependency 'SwiftMessages', '9.0.6'
  s.dependency 'Moya'
  
  # s.resource_bundles = {
  #   'OSPKit' => ['OSPKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
