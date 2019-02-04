#
# Be sure to run `pod lib lint EasyPopUp.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasyPopUp'
  s.version          = '0.1.1'
  s.summary          = 'Easy way to transform UIViews/UIViewControllers to popups'



  s.homepage         = 'https://github.com/mohammadz74/EasyPopUp'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mohammad' => 'mohammad_z74@icloud.com' }
  s.source           = { :git => 'https://github.com/Mohammadz74/EasyPopUp.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mohammad_Z74'

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.source_files = 'EasyPopUp/Classes/**/*'

  s.frameworks = 'UIKit'
  s.dependency 'DynamicBlurView', '~> 2.0'
   
   
   
end
