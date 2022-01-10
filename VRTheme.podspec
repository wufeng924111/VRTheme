Pod::Spec.new do |s|
  s.name         = "VRTheme"
  s.version      = "1.0.0"
  s.summary      = "VRTheme"
  s.homepage     = "https://github.com/wufeng924111/VRTheme.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "veer" => "panzhiwen123@foxmail.com" }
  s.platform     = :ios, "8.0"
  s.source     = { :git => "https://github.com/wufeng924111/VRTheme.git", :tag => 'v1.0.0'   }
  s.source_files  = 'VRTheme/**/*.{h,m}'
  s.requires_arc = true
  s.dependency "SSZipArchive"
end