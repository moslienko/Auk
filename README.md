# Auk, an image slideshow for iOS / Swift

This is an iOS library that shows an image carousel with a page indicator. Users can scroll through local and remote images or watch them scroll automatically.

**In this version of the Auk project, `Moa` is replaced with the `Kingfisher` library.**

<img src='https://raw.githubusercontent.com/moslienko/Auk-Kingfisher/master/Graphics/Screenshots/mainScreen.png' width='120' style='display:block; margin-left: auto;margin-right: auto;' alt='Screenshot demo app'>

```Swift
  let imageUrl = "https://www.youWebSite.com/pathToImage.jpg"
  scrollView.auk.show(url: imageUrl)
```

## Setup

There are two ways you can add Auk to your Xcode project.

#### Add source (iOS 7+)

Simply add two files to your project:

1. Kingfisher image downloader [Kingfisher](https://github.com/onevcat/Kingfisher).
2. Auk image slideshow [AukDistrib.swift](https://github.com/moslienko/Auk-Kingfisher/blob/master/Distrib/AukDistrib.swift).

#### Setup with CocoaPods (iOS 8+)

If you are using CocoaPods add this text to your Podfile and run `pod install`.

    use_frameworks!
    target 'Your target name'
    pod 'Kingfisher'
    pod 'Auk', :git => 'https://github.com/moslienko/Auk-Kingfisher.git'

<img src='https://raw.githubusercontent.com/moslienko/Auk-Kingfisher/master/Graphics/Screenshots/frameworks.png' width='160' style='display:block; margin-left: auto;margin-right: auto;' alt='Included frameworks'>

## Usage

1. Add `import Auk`  to your source code if you used Carthage or CocoaPods setup methods.
1. Add a scroll view to the storyboard and create an outlet property `scrollView` in your view controller.
1. Clear the **Adjust Scroll View Insets** checkbox in the *Attribute Inspector* of your view controller.

Auk extends UIScrollView class by creating the `auk` property.

```Swift
// Show remote images
scrollView.auk.show(url: "https://bit.ly/auk_image")
scrollView.auk.show(url: "https://bit.ly/remote_image")

// Show local image
if let image = UIImage(named: "bird.jpg") {
  scrollView.auk.show(image: image)
}
```

## License
Auk is released under the [MIT License](LICENSE).
