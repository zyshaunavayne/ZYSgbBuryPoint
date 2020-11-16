
Pod::Spec.new do |spec|

  spec.name         = "ZYSgbBuryPoint"
  spec.version      = "0.0.36"
  spec.summary      = "ZYSgbBuryPoint"
  spec.description  = "runtime based bury point sdk for sgb."
  spec.homepage     = "https://github.com/zyshaunavayne/ZYSgbBuryPoint"
  spec.license      = "MIT"
  spec.author       = { "zhangyushaunavayne" => "shaunavayne@vip.qq.com" }
  spec.platform     = :ios,"9.0"
  spec.dependency    "AFNetworking"
  spec.vendored_libraries = "ZYBuryPoint/Products/libZYBuryPoint.a"
  spec.frameworks   = "Foundation","UIKit"
  spec.source       = { git: "https://github.com/zyshaunavayne/ZYSgbBuryPoint.git", tag: spec.version, submodules: true }
  spec.source_files  = "ZYBuryPoint/ZYBuryPoint/*.a","ZYBuryPoint/ZYBuryPoint/*.h"
end
