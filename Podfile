platform :ios, '15.0'
use_frameworks!
target 'SmallGoal' do
  
  ## Extension 工具库相关
  pod 'JKSwiftExtension'
  
  ## UIKit
  
  ## storage
  pod 'SwiftyUserDefaults' ## https://github.com/sunshinejr/SwiftyUserDefaults.git
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
end

