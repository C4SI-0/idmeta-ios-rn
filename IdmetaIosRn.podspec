# FlutterModuleRn.podspec

require './ios/Podspecs/common'

Pod::Spec.new do |s|
  setCommonProps(s)
  s.name         = "IdmetaIosRn"
  s.description  = <<-DESC
                  idmeta_ios_rn
                   DESC
  s.source_files = "ios/**/*.{h,c,cc,cpp,m,mm,swift}"

  s.dependency "React-Core"
  s.dependency "Flutter"
  s.dependency "FlutterModuleFrameworks-Debug"
  s.dependency "FlutterModuleFrameworks-Release"
end

