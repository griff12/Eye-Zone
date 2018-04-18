platform :ios, '9.0'

target 'Eye Zone' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Eye Zone

pod 'Firebase'
pod 'Firebase/Auth'
pod 'Firebase/Database'
pod 'SVProgressHUD'
pod 'ChameleonFramework'
pod 'Firebase/Core'
pod 'FirebaseUI/Facebook'
pod 'FBSDKLoginKit'
pod 'FacebookCore'
pod 'FacebookLogin'
pod 'FacebookShare'
pod 'RealmSwift'
end

post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
end
end
end
