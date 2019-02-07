Pod::Spec.new do |s|
  s.name        = "Auk"
  s.version     = "9.0.0"
  s.license     = { :type => "MIT" }
  s.homepage    = "https://github.com/moslienko/Auk-Kingfisher"
  s.summary     = "An image slideshow for iOS written in Swift."
  s.description  = <<-DESC
                   This is an iOS library that shows an image carousel with a page indicator. Users can scroll through local and remote images or watch them scroll automatically.

                   * Allows to specify placeholder and error images for remote sources.
                   * Includes ability to simulate and verify image download in unit tests.
                   * Supports animated transition during screen orientation change.
                   * Includes image caching.
                   * Supports right-to-left languages.
                   DESC
  s.authors     = { "Evgenii Neumerzhitckii" => "sausageskin@gmail.com" }
  s.source      = { :git => "https://github.com/moslienko/Auk-Kingfisher.git", :tag => s.version }
  s.screenshots  = "https://raw.githubusercontent.com/moslienko/Auk-Kingfisher/master/Graphics/Screenshots/mainScreen.png"
  s.source_files = "Auk/**/*.swift"
  s.ios.deployment_target = "8.0"
  s.dependency "Kingfisher"
  s.swift_version = "4.2"
end