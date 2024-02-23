#
# Be sure to run `pod lib lint osp_selfie.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OSPSDK'
  s.version          = '1.0.0'
  s.summary          = 'Used for verifying document information and conducting liveness detection.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'The OSPSDK Inquiry flow lets you securely and seamlessly collect your user\'s information'

  s.homepage         = 'https://github.com/aai-osp-fe/aai-osp-ios-sdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'loong' => 'yulong.chen@advancegroup.com' }
  s.source           = { :git => 'https://github.com/aai-osp-fe/aai-osp-ios-sdk.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_version    = '5.0'
  s.platform         = :ios, '13.0'

  s.ios.deployment_target = '13.0'
#  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'arm64' }
#  s.pod_target_xcconfig = { 'ARCHS[sdk=iphoneos*]' => '$(ARCHS_STANDARD)' }

  s.pod_target_xcconfig = {
      'ARCHS' => 'arm64',
      'VALID_ARCHS' => 'arm64'
  }

#  s.source_files = 'Resources/Classes/**/*'
  
  s.vendored_frameworks = ['Resources/Frameworks/FaceTecSDK.framework',
                           'Resources/Frameworks/OSPSDK.framework',
                           'Resources/Frameworks/CaptureCore.framework',
                           'Resources/Frameworks/CaptureUX.framework']
  
  # s.resource_bundles = {
  #   'osp_selfie' => ['osp_selfie/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'PromiseKit'
  s.dependency 'SwiftMessages'
  s.dependency 'Moya', '15.0.0'
  
#  s.subspec 'All' do |ospsdk|
#      ospsdk.vendored_frameworks = [
#        'Resources/Frameworks/FaceTecSDK.xcframework',
#        'Resources/Frameworks/OSPSDK.framework',
#        'Resources/Frameworks/CaptureCore.xcframework',
#        'Resources/Frameworks/CaptureUX.xcframework'
#      ]
#  end
#
#  s.subspec 'Selfie' do |selfie|
#    selfie.vendored_frameworks = [
#      'Resources/Frameworks/FaceTecSDK.xcframework',
#      'Resources/Frameworks/Selfie.framework'
#    ]
#  end
#
#  s.subspec 'Document' do |document|
#    document.vendored_frameworks = [
#      'Resources/Frameworks/CaptureCore.xcframework',
#      'Resources/Frameworks/CaptureUX.xcframework',
#      'Resources/Frameworks/Document.framework'
#    ]
#  end

end
