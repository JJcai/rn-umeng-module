require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "RNUmeng"
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.platforms    = { :ios => "9.0", :tvos => "9.2" }

  s.source       = { :git => "https://github.com/yz1311/rn-umeng-module.git", :tag => "v#{s.version}" }
  s.source_files  = "ios/**/*.{h,m}"
  #基础
  s.dependency 'React'
  s.dependency 'UMCommon'
  s.dependency 'UMDevice'
  s.dependency 'UMAPM'

  #分享
  s.dependency 'UMShare/UI'
end
