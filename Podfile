# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'BryanMandiriAssesment' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for BryanMandiriAssesment
  pod 'Moya', '~> 15.0'
  pod 'ObjectMapper', '~> 3.5'
  pod 'RxSwift', '6.5.0'
  pod 'RxCocoa', '6.5.0'
  pod 'Reusable'
  pod 'Kingfisher', '~> 7.0'
  pod 'SnapKit', '~> 5.0.0'
  pod 'UIScrollView-InfiniteScroll', '~> 1.3.0'
  pod "youtube-ios-player-helper", "~> 1.0.4"

end
post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
               end
          end
   end
end