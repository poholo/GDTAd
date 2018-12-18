Pod::Spec.new do |s|
    s.name             = "GDTAd"
    s.version          = "4.6.4"
    s.summary          = "广点通官方库映射. "
    s.description      = "GDTAd是对广点通的映射，使用pod依赖管理，便于开发者快速集成广点通的广告能力。"
    s.license          = 'MIT'
    s.author           = { "littleplayer" => "mailjiancheng@163.com" }
    s.homepage         = "https://github.com/poholo/GDTAd"
    s.source           = { :git => "https://github.com/poholo/GDTAd.git", :tag => s.version.to_s }

    s.platform     = :ios, '8.0'
    s.requires_arc = true


    s.public_header_files = 'SDK/include/*.h'
    s.vendored_library = 'SDK/lib/*.a'
    s.source_files = 'SDK/include/*.{h,m,mm}'

    s.ios.frameworks = 'AdSupport', 'Security', 'StoreKit', 'CoreMotion', 'CoreLocation', 'CoreTelephony', 'SystemConfiguration', 'QuartzCore'

end