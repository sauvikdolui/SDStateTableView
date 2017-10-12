#
# Be sure to run `pod lib lint SDStateTableView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SDStateTableView'
  s.version          = '0.1.0'
  s.summary          = 'A subclass of UITableView to show states like data load error, no data found, no internet connect easily.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A subclass of UITableView to show states like data load error, no data found, no internet connect easily. It helps you not to write a table view subclass for every poject to maintain these states.

DESC

  s.homepage         = 'https://github.com/sauvikdolui/SDStateTableView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sauvikdolui' => 'sauvikdolui@gmail.com' }
  s.source           = { :git => 'https://github.com/sauvikdolui/SDStateTableView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/sauvik_dolui'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SDStateTableView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SDStateTableView' => ['SDStateTableView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency  'AFNetworking', '~> 2.3'

end
