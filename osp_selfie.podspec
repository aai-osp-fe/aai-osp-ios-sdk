#
# Be sure to run `pod lib lint osp_selfie.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'osp_selfie'
  s.version          = '1.0.0'
  s.summary          = 'Used to verify whether the current user is a real person'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'The osp_selfie Inquiry flow lets you securely and seamlessly collect your user\'s information'

  s.homepage         = 'https://github.com/aai-osp-fe/aai-osp-ios-sdk-selfie'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'loong' => 'yulong.chen@advancegroup.com' }
  s.source           = { :git => 'https://github.com/aai-osp-fe/aai-osp-ios-sdk-selfie.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_version = '5.0'
  s.vendored_frameworks = ['osp_selfie/Frameworks/FaceTecSDK.xcframework','osp_selfie/Frameworks/onestopSDK.framework']
  s.ios.deployment_target = '13.0'

  s.source_files = 'osp_selfie/Classes/**/*'
  
  # s.resource_bundles = {
  #   'osp_selfie' => ['osp_selfie/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
