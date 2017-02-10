#
# Be sure to run `pod lib lint BLKDialog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BLKDialog'
  s.version          = '0.1.0'
  s.summary          = 'A Dialog framework.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://www.blkee.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LiuHangqi' => 'liuhangqi@live.com' }
  s.source           = { :git => '~/dev/BLKDialog' }

  s.ios.deployment_target = '8.0'

  s.source_files = 'BLKDialog/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BLKDialog' => ['BLKDialog/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'MBProgressHUD'
end
