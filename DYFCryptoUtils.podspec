
Pod::Spec.new do |spec|
  spec.name         = "DYFCryptoUtils"
  spec.version      = "1.1.1"
  spec.summary      = "Achieves Base64, 32/16 bit MD5, DES, AES and RSA algorithms for iOS."

  spec.homepage     = "https://github.com/itenfay/DYFCryptoUtils"
  # spec.screenshots = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author       = { "Tenfay" => "itenfay@163.com" }

  spec.platform     = :ios
  # spec.platform   = :ios, "5.0"

  #  When using multiple platforms
  spec.ios.deployment_target = "8.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"

  spec.source       = { :git => "https://github.com/itenfay/DYFCryptoUtils.git", :tag => spec.version.to_s }

  spec.source_files  = "Classes/**/*.{h,m}"
  spec.public_header_files = "Classes/**/*.h"
  # spec.exclude_files = "Classes/Exclude"

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"
end