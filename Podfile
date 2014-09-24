platform :ios, '7.0'

# Add Application pods here

target :unit_tests, :exclusive => true do
  link_with 'UnitTests'
  pod 'Specta'
  pod 'Expecta'
  pod 'OCMock'
  pod 'OHHTTPStubs'
  pod 'KIF', '~> 3.0'
end

# Tests weren't building on xCode 6. Getting 'cannot find XCTest.h'
# Added the code below to fix; based on:
#     https://github.com/kif-framework/KIF/issues/419
post_install do |installer|
  installer.project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['FRAMEWORK_SEARCH_PATHS'] = [ '$(PLATFORM_DIR)/Developer/Library/Frameworks' ]
    end
  end
end
