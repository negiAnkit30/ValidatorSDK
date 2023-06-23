
Pod::Spec.new do |spec|

  spec.name         = "ValidatorSdk"
  spec.version      = "1.0.0"
  spec.summary      = "This is my first SDK framework"
  spec.description  = "This is the beginning of new chapter"
  
  spec.homepage     = "https://github.com/negiAnkit30/ValidatorSDK/tree/main"
  spec.license      = "MIT"
  spec.author             = { "Ankit Negi" => "ankitrajsinghnegi@gmail.com" }
  spec.platform     = :ios, "13.2"
  spec.source       = { :git => "https://github.com/negiAnkit30/ValidatorSDK.git", :tag => spec.version.to_s }
  spec.source_files  = "EmailValidator/**/*.{swift}"
  spec.swift_version = "5.0"
end
