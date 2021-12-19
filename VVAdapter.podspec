Pod::Spec.new do |spec|
  spec.name         = "VVAdapter"
  spec.version      = "0.0.1"
  spec.summary      = "VVAdapter"
  spec.homepage     = "https://github.com/chinaxxren/VVAdapter"
  spec.license      = "MIT"
  spec.author       = { "chinaxxren" => "jiangmingz@qq.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "git@github.com:chinaxxren/VVAdapter.git", :tag => "#{spec.version}" }
  spec.source_files = 'Source/Classes/**/*.*'
  spec.swift_version   = "5.0"
end
