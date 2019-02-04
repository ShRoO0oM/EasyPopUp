//
//  EasyPopupConfig.swift
//  EasyPopUp
//
//  Created by Mohammad on 5/31/18.
//

import UIKit
import DynamicBlurView

/// Config for popup
public struct EasyPopupConfig {
    
    public var shadowEnabled : Bool // popup shadow
    public var cornerRadius: CGFloat // the cornerRadius of popup
    public var dimBackground : Bool // dim the backView of popup
    public var blurBackground : Bool // whether contain blur or not
    public var autoDismiss: Bool // the autoDismiss that dimiss popup when clicking on outside of view
    public var animationType: AnimationType // animationType enum
    public var animaionDuration : TimeInterval // animaionDuration
    public var animtionOptions: UIView.AnimationOptions // UIViewAnimationOptions
    public var blurRadius: CGFloat /// Blur Radius you should enable the blurBackground variable to work
    public var blurTrackingMode : TrackingMode /// DynamicBlurView trackingMode
    
    public init(shadowEnabled:Bool = true,cornerRadius: CGFloat = 3 ,dimBackground:Bool = true,blurBackground:Bool = false ,autoDismiss:Bool = true ,animationType:AnimationType = .upToDown,animtionOptions : UIView.AnimationOptions = UIView.AnimationOptions.curveEaseOut ,animaionDuration :TimeInterval = 0.3,blurRadius: CGFloat = 8,blurTrackingMode:TrackingMode = .common  ) {
        self.shadowEnabled = shadowEnabled
        self.cornerRadius = cornerRadius
        self.dimBackground = dimBackground
        self.blurBackground = blurBackground
        self.autoDismiss = autoDismiss
        self.animationType = animationType
        self.animaionDuration = animaionDuration
        self.animtionOptions = animtionOptions
        self.blurRadius = blurRadius
        self.blurTrackingMode = blurTrackingMode
    }
}


