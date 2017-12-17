
Pod::Spec.new do |s|
s.name             = 'Loadmation'
s.version          = '0.0.1'
s.summary          = 'A very simple loading indicator for Swift.'

s.description      = <<-DESC
A very simple loading indicator for Swift. Create awesome loading animation easily.
DESC

s.homepage         = 'https://github.com/saqibomer/Loadmation'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Saqib Omer' => 'saqibomer.cs@gmail.com' }
s.source           = { :git => 'https://github.com/saqibomer/Loadmation.git', :tag => s.version.to_s }

s.ios.deployment_target = '10.0'
s.source_files = 'Loadmation/Loadmation.swift'

end
