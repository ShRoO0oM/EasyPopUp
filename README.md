<p align="center">
	<img src="https://github.com/mohammadZ74/EasyPopUp/blob/master/EasyPopUp/Assets/1.png" width="500">
</p>
<p align="center">
    <img src="https://img.shields.io/badge/Swift-4.2-green.svg" />
        <img src="https://img.shields.io/badge/platform-ios-green.svg" />
    <a href="https://opensource.org/licenses/MIT">
      <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License" />
    </a>
</p>
<p>&nbsp;</p>

# Introduction

With EasyPopup you can easily convert your views/UViewController's into Popups.


scale | rightToleft | upTodown | scale | leftToRight | upTodown
--- | --- | --- | --- | --- | ---
![scale](https://github.com/mohammadZ74/EasyPopUp/blob/master/EasyPopUp/Assets/scale.gif) | ![rightToleft](https://github.com/mohammadZ74/EasyPopUp/blob/master/EasyPopUp/Assets/rightToleft.gif) | ![upTodown](https://github.com/mohammadZ74/EasyPopUp/blob/master/EasyPopUp/Assets/upToDown.gif) | ![scale](https://github.com/mohammadZ74/EasyPopUp/blob/master/EasyPopUp/Assets/vcScale.gif) | ![leftToRight](https://github.com/mohammadZ74/EasyPopUp/blob/master/EasyPopUp/Assets/VCLeftToRight.gif) | ![upTodown](https://github.com/mohammadZ74/EasyPopUp/blob/master/EasyPopUp/Assets/vcUpToDown.gif)






<p>&nbsp;</p>

# Installation

EasyPopUp is available through [CocoaPods](https://cocoapods.org/pods/EasyPopUp). Simply add the following to your Podfile:

```ruby
use_frameworks!

target '<Your Target Name>'
pod 'EasyPopUp'
```
### Swift Package Manager

To integrate using Apple's Swift package manager, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/mohammadZ74/EasyPopUp.git", .upToNextMajor(from: "1.0.0"))
```

and then specify `"Hero"` as a dependency of the Target in which you wish to use Hero.
Here's an example `PackageDescription`:

```swift
// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "MyPackage",
    products: [
        .library(
            name: "MyPackage",
            targets: ["MyPackage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mohammadZ74/EasyPopUp.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "MyPackage",
            dependencies: ["EasyPopUp"])
    ]
)
```

# Demo
You can easily find and run the demo app in example folder.

# Usage
EasyPopup is composed of two classes; one for views and the other for ViewControllers.
## View Usage

for view usage you should just pass your superView of your view and your view that you want to be your popup.
you can give your custom config file (find the complete explanation down below) for custom transtions,shadows,corners,... .

```swift
public init(superView: UIView, viewTopop view: UIView, config: EasyPopupConfig = default)
// example
let popupView = EasyPopup(superView: self.view, viewTopop: viewToPop)
```

then you can show your popup with:

```swift
public func Showpopup(completion: ((Bool) -> Void)? = nil)
// example 
popupView.showPopup { (isfinished) in
          // do after showing popup 
}
```
you can just show your popup or with completion handler do anything after popup animation is finished.

and for dismissing popup :

```swift
public func removePopup(completion: ((Bool) -> Void)? = nil)
// example 
popupView.removePopup { (isfinished) in
          // do after dismissing popup 
}
```
## ViewController Usage
for viewController usage your view controller must conform to `EasyPopUpViewControllerDatasource`
you should pass your view ( which is in your view controller ) that you want to popup.
note that your view should have constraints in your view controller.
```swift
public init(sourceViewController: UIViewController, destinationViewController: UIViewController, config: EasyPopupConfig = default)
}
```
`sourceViewController` : the source viewController that you want to appear popup on.
`destinationViewController` : the popup viewController that you want to show.
`config` : the EasyPopup config file for giving custom shadow,transitions,cornerRadius,... .

Usage Example:

in your popup viewController class: 

```swift
class popViewController: UIViewController {
    @IBOutlet weak var popupContentView: UIView!
}
extension popViewController : EasyPopUpViewControllerDatasource {
    var popupView: UIView {
        return popupContentView
    }
}
```
and in your source viewController:
```swift
let popupVC = self.storyboard?.instantiateViewController(withIdentifier: "popViewController") as! popViewController
let easePopUp = EasyViewControllerPopup(sourceViewController: self, destinationViewController: popupVC )
```
for showing popup use the `showVCAsPopup` method
```swift
easePopUp.showVCAsPopup()
```
for dismissing simply dismiss the viewController. don't worry easypopup ovverride the default transition.

If the usage guide wasn't useful,please run and look the example project.It will boost you 😇

# Customization

Easypopup uses configuration for custom transitions,Blurs,cornerRadius and shadows.

you can pass the config popup object:
```swift
popUpView.config = popUpConfig // or pass it via initializar  
```
the config contains these properties:
```swift
    public var shadowEnabled : Bool // popup shadow
    public var cornerRadius: CGFloat // the cornerRadius of popup
    public var dimBackground : Bool // dim the backView of popup
    public var blurBackground : Bool // whether contain blur or not
    public var autoDismiss: Bool // the autoDismiss that dimiss popup when clicking on outside of view
    public var animationType: AnimationType // animationType enum
    public var animaionDuration : TimeInterval // animaionDuration
    public var animtionOptions: UIViewAnimationOptions // UIViewAnimationOptions
    public var blurRadius: CGFloat /// Blur Radius you should enable the blurBackground variable to work
    public var blurTrackingMode : TrackingMode /// DynamicBlurView trackingMode
```
EasyPopup use [`DynamicBlurView`](https://github.com/KyoheiG3/DynamicBlurView) for background blur.
the animationType is the way your popup animates:
```swift
public enum AnimationType {
    case scale
    case upToDown
    case downToUp
    case immediate
    case rightToleft
    case leftToright
}
```

# License

EasyPopup is available under the MIT license. See the LICENSE file for more info.
