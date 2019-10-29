Pod::Spec.new do |s|

  s.name         = "SwiftExtension"
  s.version      = "0.0.2"
  s.summary      = "对Swift的一些扩展集合，方便使用"
  s.description  = <<-DESC
	对Swift的一些扩展集合，方便使用，提高效率
                        DESC

  s.homepage     = "https://github.com/wooseng/SwiftExtension"
  s.license      = "LICENSE"
  s.author       = { "wooseng" => "zhanbaocheng@vip.qq.com" }
  s.platform     = :ios, "10.0"
  s.source = { :git => 'https://github.com/wooseng/SwiftExtension.git', :tag => s.version }
  s.source_files  = "Sources/*.swift", "Sources/**/*.swift"
  s.swift_version = '5.0'
  s.requires_arc = true

end
