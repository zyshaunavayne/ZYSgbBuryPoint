
Pod::Spec.new do |spec|

  spec.name         = "ZYSgbBuryPoint"
  spec.version      = "0.0.22"
  spec.summary      = "ZYSgbBuryPoint"
  spec.description  = "runtime based bury point sdk for sgb."
  spec.homepage     = "https://github.com/zyshaunavayne/ZYSgbBuryPoint"
  spec.license      = "MIT"
  spec.author             = { "zhangyushaunavayne" => "shaunavayne@vip.qq.com" }
  spec.platform     = :ios,"10.0"
  spec.dependency "AFNetworking"
  spec.frameworks   = "Foundation","UIKit"
  spec.source       = { git: "https://github.com/zyshaunavayne/ZYSgbBuryPoint.git", tag: spec.version, submodules: true }
  spec.source_files  = "ZYBuryPoint/ZYBuryPoint/**/*.{h,m},"ZYBuryPoint/ZYBuryPoint. xcodeproj"
end
