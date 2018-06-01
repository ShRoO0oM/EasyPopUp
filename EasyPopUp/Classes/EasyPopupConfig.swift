//
//  EasyPopupConfig.swift
//  EasyPopUp
//
//  Created by Mohammad on 5/31/18.
//

import UIKit

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
    
    
    
    public init(shadowEnabled:Bool = true,cornerRadius: CGFloat = 3 ,dimBackground:Bool = true,blurBackground:Bool = false ,autoDismiss:Bool = true ,animationType:AnimationType = .upToDown,animtionOptions : UIViewAnimationOptions = UIViewAnimationOptions.beginFromCurrentState ,animaionDuration :TimeInterval = 0.3 ) {
        self.shadowEnabled = shadowEnabled
        self.cornerRadius = cornerRadius
        self.dimBackground = dimBackground
        self.blurBackground = blurBackground
        self.autoDismiss = autoDismiss
        self.animationType = animationType
        self.animaionDuration = animaionDuration
        self.animtionOptions = animtionOptions
    }
}


