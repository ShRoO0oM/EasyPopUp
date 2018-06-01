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
    
    public var shadowEnabled : Bool
    public var cornerRadius: CGFloat
    public var dimBackground : Bool
    public var blurBackground : Bool
    public var autoDismiss: Bool
    public var animationType: AnimationType
    public var animaionDuration : TimeInterval
    public var animtionOptions: UIViewAnimationOptions
    /// Blur Radius you should enable the blurBackground variable to work
    public var blurRadius: CGFloat
    /// DynamicBlurView trackingMode
    public var blurTrackingMode : TrackingMode
    
    
    public init(shadowEnabled:Bool = true,cornerRadius: CGFloat = 3 ,dimBackground:Bool = true,blurBackground:Bool = false ,autoDismiss:Bool = true ,animationType:AnimationType = .upToDown,animtionOptions : UIViewAnimationOptions = UIViewAnimationOptions.beginFromCurrentState ,animaionDuration :TimeInterval = 0.3,blurRadius: CGFloat = 8,blurTrackingMode:TrackingMode = .common  ) {
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


