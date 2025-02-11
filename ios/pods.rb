require 'json'

def use_idmeta_ios_rn! (options={})
  package = JSON.parse(File.read(File.join(__dir__, "../package.json")))
  packageName = package['name']
  prefix = options[:path] ||= "../node_modules/#{packageName}"

  pod 'Flutter', :podspec => "#{prefix}/build/ios/framework/Release/Flutter.podspec"
  pod 'FlutterModuleFrameworks-Debug',
    :configuration => 'Debug',
    :podspec => "#{prefix}/ios/Podspecs/IdmetaIosRn-Debug.podspec"
  pod 'FlutterModuleFrameworks-Release',
    :configuration => 'Release',
    :podspec => "#{prefix}/ios/Podspecs/IdmetaIosRn-Release.podspec"
end

