#
# Be sure to run `pod lib lint iiwi.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iiwi'
  s.version          = '0.1.0'
  s.summary          = 'iiwi simplifies usage of Core Data'

  s.description      = <<-DESC
iiwi is a simple library which helps set up Core Data in application. It relies on NSPersistentContainer and provides implementation of base repositories. Repository allows CRUD operations. There is also convenienece solution for fetching enitities based on generic primary key.
  
                       DESC

  s.homepage         = 'https://github.com/rogowskimark/iiwi'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rogowskimark' => 'rogowski.mark@gmail.com' }
  s.source           = { :git => 'https://github.com/rogowskimark/iiwi.git', :tag => s.version.to_s }
  s.swift_version = '4.2'

  s.ios.deployment_target = '11.0'

  s.source_files = 'iiwi/Classes/**/*'
  

end
