Pod::Spec.new do |s|
  s.name             = "Pitchy"
  s.summary          = "A simple way to get a music pitch from a frequency"
  s.version          = "1.0.0"
  s.homepage         = "https://github.com/vadymmarkov/Pitchy"
  s.license          = 'MIT'
  s.author           = { "Vadym Markov" => "markov.vadym@gmail.com" }
  s.source           = { :git => "https://github.com/vadymmarkov/Pitchy.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/vadymmarkov'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.requires_arc = true
  s.ios.source_files = 'Source/**/*'
  s.osx.source_files = 'Source/**/*'

  s.frameworks = 'Foundation'
end
