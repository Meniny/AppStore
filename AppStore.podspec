Pod::Spec.new do |s|
  s.name             = 'AppStore'
  s.version          = '1.1.0'
  s.summary          = 'An AppStore version cheaking framework in Swift.'

  s.homepage         = 'https://github.com/Meniny/AppStore'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.authors          = { 'Elias Abel' => 'admin@meniny.cn' }
  s.source           = { :git => 'https://github.com/Meniny/AppStore.git', :tag => s.version.to_s }
  s.social_media_url = 'https://meniny.cn'
  # s.screenshot       = ''

  s.swift_version    = "4.0"
  s.ios.deployment_target = '8.0'

  s.source_files     = "AppStore/**/*.{h,swift}"
  s.resources        = ["AppStore/AppStore.bundle"]

  s.framework        = 'Foundation', 'UIKit'
  s.module_name      = 'AppStore'
end
