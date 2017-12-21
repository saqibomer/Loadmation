
Pod::Spec.new do |s|

  s.name         = "Loadmation"
  s.version      = "0.0.2"
  s.summary      = "Simple Loading Animation"

  s.description  = <<-DESC
                   Add a loading animation to your project easily. 
                   DESC

  s.homepage     = "https://github.com/saqibomer/Loadmation"
  s.screenshots  = "https://raw.githubusercontent.com/saqibomer/Loadmation/master/sc.png"


 
  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "Saqib" => "saqibomer.cs@gmail.com" }

 

  s.platform     = :ios, "10.0"


  s.source       = { :git => "https://github.com/saqibomer/Loadmation.git", :tag => s.version }


  s.source_files  = "Src/**/*.{h,m,swift,png}"
  

 

end
