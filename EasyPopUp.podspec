#
# Be sure to run `pod lib lint EasyPopUp.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasyPopUp'
  s.version          = '0.1.0'
  s.summary          = 'Easy way to transform UIViews to popups'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/mohammadz74/EasyPopUp'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mohammad' => 'mohammad_z74@icloud.com' }
  s.source           = { :git => 'https://github.com/Mohammadz74/EasyPopUp.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'

  s.source_files = 'EasyPopUp/Classes/**/*'
  
  # s.resource_bundles = {
  #   'EasyPopUp' => ['EasyPopUp/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  
   s.frameworks = 'UIKit'
   s.dependency 'DynamicBlurView', '~> 2.0'
   
   
   
end
