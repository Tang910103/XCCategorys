Pod::Spec.new do |s|
    s.name         = "XCCategorys"
    s.version      = "1.0.0"
    s.summary      = "常用工具"
    s.description  = "常用工具库"
    s.homepage     = "https://github.com/Tang910103"
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author             = { "Tang杰" => "tang910103@qq.com" }
    s.platform     = :ios
    s.source       = { :git => "https://github.com/Tang910103/XCCategorys.git", :tag => "#{s.version}" }
    s.source_files  = "ViewCotroller/**/*.{h,m}"
    s.dependency "AvoidCrash"
    s.dependency "NullSafe"

end
