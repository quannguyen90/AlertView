#
# Be sure to run `pod lib lint AlertView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.name             = "AlertView"
  s.version          = "0.1.0"
  s.summary          = "Custom UIAlertView"
  s.homepage         = "https://github.com/quannguyen90/AlertView"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Quan Nguyen Van" => "quannv.tm@gmail.com" }
  s.source           = { :git => "https://github.com/quannguyen90/AlertView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/quannguyen90'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/AlertView/*.{h,m}'
  s.resource_bundles = {
        'AlertView' => ['Pod/Assets/*.png','Pod/Classes/AlertView/*.{xib}']
  }
  s.xcconfig = { "APPLY_RULES_IN_COPY_FILES" => "YES", "STRINGS_FILE_OUTPUT_ENCODING" => "binary" }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'



end
