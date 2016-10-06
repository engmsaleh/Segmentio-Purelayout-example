platform :ios, '8.0'

target 'Segmentio-Purelayout-example' do
  use_frameworks!
  pod 'PureLayout'
  pod 'Segmentio'
  
  post_install do |installer|
      installer.pods_project.build_configurations.each do |config|
          # Configure Pod targets for Xcode 8 compatibility
          config.build_settings['SWIFT_VERSION'] = '2.3'
          config.build_settings['PROVISIONING_PROFILE_SPECIFIER'] = 'U7XY9CE3YC/'
          config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
      end
  end
  
end
