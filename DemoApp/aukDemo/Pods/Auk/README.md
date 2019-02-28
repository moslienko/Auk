# Auk, an image slideshow for iOS / Swift

This is an iOS library that shows an image carousel with a page indicator. Users can scroll through local and remote images or watch them scroll automatically.

**In this version of the Auk project, `Moa` is replaced with the `Kingfisher` library.**

<img src='https://raw.githubusercontent.com/moslienko/Auk-Kingfisher/master/Graphics/Screenshots/mainScreen.png' width='463' alt='Screenshot demo app'>

```Swift
  let imageUrl = "https://www.youWebSite.com/pathToImage.jpg"
  scrollView.auk.show(url: imageUrl)
```

## Setup

There are three ways you can add Auk to your Xcode project.

#### Add source (iOS 10+)

Simply add two files to your project:

1. Kingfisher image downloader [Kingfisher](https://github.com/onevcat/Kingfisher).
2. Auk image slideshow [AukDistrib.swift](https://github.com/moslienko/Auk-Kingfisher/blob/master/Distrib/AukDistrib.swift).

#### Setup with Carthage (iOS 10+)

1. Add `github "moslienko/Auk-Kingfisher" ~> 9.0` to your Cartfile.
2. Run `carthage update`.
3. Add `Kingfisher` and `Auk` frameworks into your project.

#### Setup with CocoaPods (iOS 10+)

If you are using CocoaPods add this text to your Podfile and run `pod install`.

    use_frameworks!
    target 'Your target name'
    pod 'Kingfisher'
    pod 'Auk', '~> 9.0', :git => 'https://github.com/moslienko/Auk-Kingfisher.git'

## Usage

1. Add `import Kingfisher` and `import Auk`  to your source code if you used Carthage or CocoaPods setup methods.
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

// Return the number of pages in the scroll view
scrollView.auk.numberOfPages

// Get the index of the current page or nil if there are no pages
scrollView.auk.currentPageIndex

// Return currently displayed images
scrollView.auk.images
```

#### Scrolling from code

```Swift
// Scroll to page
scrollView.auk.scrollToPage(atIndex: 2, animated: true)

// Scroll to the next page
scrollView.auk.scrollToNextPage()

// Scroll to the previous page
scrollView.auk.scrollToPreviousPage()
```

#### Auto scrolling

```Swift
// Scroll images automatically with the interval of 3 seconds
scrollView.auk.startAutoScroll(delaySeconds: 3)

// Stop auto-scrolling of the images
scrollView.auk.stopAutoScroll()
```

Note that auto scrolling stops when the user starts scrolling manually.

#### Accessibility

One can pass an image description when calling the `show` methods. This description will be spoken by the device in accessibility mode for the current image on screen.

```Swift
// Supply accessibility label for the image
scrollView.auk.show(url: "https://bit.ly/auk_image", accessibilityLabel: "Picture of a great auk.")
```

#### Removing pages

```Swift
// Remove a page at given index
scrollView.auk.removePage(atIndex: 0, animated: true, completion: {})

// Remove the currently shown page
scrollView.auk.removeCurrentPage(animated: true, completion: {})

// Remove all pages
scrollView.auk.removeAll()
```


#### Updating pages

One can change existing image by calling `updateAt` methods and supplying the page index.

```Swift
// Replace the image on a given page with a remote image.
// The current image is replaced after the new image has finished downloading.
scrollView.auk.updatePage(atIndex: 0, url: "https://bit.ly/remote_image")

// Replace the image on a given page with a local image.
if let image = UIImage(named: "bird.jpg") {
  scrollView.auk.updatePage(atIndex: 1, image: image)
}
```

## Configuration

Use the `auk.settings` property to configure behavior and appearance of the scroll view **before showing the images**.

```Swift
// Make the images fill entire page
scrollView.auk.settings.contentMode = .scaleAspectFill

// Set background color of page indicator
scrollView.auk.settings.pageControl.backgroundColor = UIColor.gray.withAlphaComponent(0.3)

// Show placeholder image while remote image is being downloaded.
scrollView.auk.settings.placeholderImage = UIImage(named: "placeholder.jpg")

// Show an image AFTER specifying the settings
scrollView.auk.show(url: "https://bit.ly/auk_image")
```

## Preloading remote images

By default remote images are loaded after they become visible to user. One can ask the library to preload remote images  by setting the property `preloadRemoteImagesAround`.

```Swift
// Set the property before showing remote images
scrollView.auk.settings.preloadRemoteImagesAround = 1

// Add remote images. The first two images will start loading simultaneously.
scrollView.auk.show(url: "https://bit.ly/auk_image")
scrollView.auk.show(url: "https://bit.ly/remote_image")

// The third image will start loading when the user scrolls to the second page.
scrollView.auk.show(url: "https://bit.ly/auks_at_home")
```

## License
Auk is released under the [MIT License](LICENSE).
