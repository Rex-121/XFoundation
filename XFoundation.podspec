#
# Be sure to run `pod lib lint XFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XFoundation'
  s.version          = '0.0.1'
  s.summary          = '基础功能库'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Rex-121/XFoundation'
  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rex' => '121' }
  s.source           = { :git => 'git@github.com:Rex-121/XFoundation.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '9.0'
  
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |ss|
      
      ss.source_files = 'XFoundation/Core/**/*'
      
      end
  
  #s.source_files = 'XFoundation/**/**/*.{h,m}'
  
  # s.subspec 'Foundation' do |fo|
  #      fo.source_files = 'XFoundation/Foundation/**/*'
  #  end
  
  s.subspec 'Random' do |ran|
      ran.source_files = 'XFoundation/Core/RandomNumber/**/*'
  end
  
  #  s.subspec 'Array' do |arr|
  #     arr.source_files = 'XFoundation/Foundation/RandomNumber/*.{h,m}', 'XFoundation/Foundation/Array/*.{h,m}'
  #  end
  
  # s.subspec 'RAC' do |rac|
  #     rac.source_files = 'XFoundation/RAC/*'
      #     rac.dependency 'XFoundation/Core'
      #     rac.dependency 'ReactiveObjC'
      # end
      # s.dependency 'ReactiveObjC'
end
