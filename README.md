<p align="center">
	<img src="https://github.com/mohammadZ74/EasyPopUp/blob/master/EasyPopUp/Assets/1.png" width="500">
</p>
<p align="center">
    <img src="https://img.shields.io/badge/Swift-4.1-green.svg" />
        <img src="https://img.shields.io/badge/platform-ios-green.svg" />
    <a href="https://opensource.org/licenses/MIT">
      <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License" />
    </a>
</p>
<p>&nbsp;</p>

# Introduction

With EasyPopup you can easily convert your views/UViewController's to Popups.

<p>&nbsp;</p>

# Installation

EasyPopUp is available through [CocoaPods](http://cocoapods.org). Simply add the following to your Podfile:

```ruby
use_frameworks!

target '<Your Target Name>'
pod 'EasyPopUp'
```

# Demo
You can easily find and run the demo app in example folder.

# Usage
EasyPopup divided to two classes one for views and the other for ViewControllers.
## View Usage

for view usage you should just pass your superView of your view and your view that you want to be your popup.

```swift
public init(superView: UIView, viewTopop view: UIView, config: EasyPopupConfig = default)
// example
let popupView = EasyPopup(superView: self.view, viewTopop: viewToPop)
```
then you can show your popup with:

```swift
public func Showpopup(completion: ((Bool) -> Void)? = nil)
// example 
popupViewpopUpView.showPopup { (isfinished) in
            // do after showing popup 
}
```
you can just show your popup or with completion handler do anything after popup animation is finished.


# License

PopupDialog is available under the MIT license. See the LICENSE file for more info.
