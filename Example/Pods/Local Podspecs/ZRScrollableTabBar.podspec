#
# Be sure to run `pod lib lint ZRScrollableTabBar.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ZRScrollableTabBar"
  s.version          = "0.1.1"
  s.summary          = "ZRScrollableTabBar is a native tab bar with unlimited items without more button."
  s.description      = "Normally tabbar shows more tab if there is more then 5 tab in a tab bar controller. To overcome this problem you can use ZRScrollableTabBar which will allow you to put as many tab as you want and they are scrollable"
  s.homepage         = "https://github.com/raihan/ZRScrollableTabBar"
  # s.screenshots     = "https://github.com/raihan/ZRScrollableTabBar/blob/master/Example/ZRScrollableTabBar/Screenshot1.png", "https://github.com/raihan/ZRScrollableTabBar/blob/master/Example/ZRScrollableTabBar/Screenshot2.png", "https://github.com/raihan/ZRScrollableTabBar/blob/master/Example/ZRScrollableTabBar/Screenshot3.png"
  s.license          = 'MIT'
  s.author           = { "raihan" => "raihan.zbr@gmail.com" }
  s.source           = { :git => "https://github.com/raihan/ZRScrollableTabBar.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/raihan49','https://www.facebook.com/raihan.zbr'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'ZRScrollableTabBar' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
end
