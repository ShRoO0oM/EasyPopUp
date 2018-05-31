//
//  EasyPopupConfig.swift
//  EasyPopUp
//
//  Created by Mohammad on 5/31/18.
//

import UIKit

/// Config for popup
public struct EasyPopupConfig {
    public var shadowColor : CGColor
    public var shadowRadius: CGFloat
    public var cornerRadius: CGFloat
    public var shadowOpacity : CGFloat
    public var dimBackground : Bool
    public var blurBackground : Bool
    public var autoDismiss: Bool
    public var animationType: AnimationType = .upToDown
    public var animaionDuration : TimeInterval = 0.3
    public var animtionOptions: UIViewAnimationOptions
    
    public init(shadowColor:CGColor = UIColor.clear.cgColor ,shadowRadius:CGFloat = 0,cornerRadius:CGFloat = 0,shadowOpacity:CGFloat = 0,dimBackground:Bool = true,blurBackground:Bool = false ,autoDismiss:Bool = true ,animationType:AnimationType = .upToDown,animtionOptions : UIViewAnimationOptions = UIViewAnimationOptions.beginFromCurrentState ,animaionDuration :TimeInterval = 0.3 ) {
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.cornerRadius = cornerRadius
        self.shadowOpacity = shadowOpacity
        self.dimBackground = dimBackground
        self.blurBackground = blurBackground
        self.autoDismiss = autoDismiss
        self.animationType = animationType
        self.animaionDuration = animaionDuration
        self.animtionOptions = animtionOptions
    }
}


