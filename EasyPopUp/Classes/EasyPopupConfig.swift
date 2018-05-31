//
//  EasyPopupConfig.swift
//  EasyPopUp
//
//  Created by Mohammad on 5/31/18.
//

import UIKit

public struct EasyPopupConfig {
    var shadowColor : CGColor
    var shadowRadius: CGFloat
    var cornerRadius: CGFloat
    var shadowOpacity : CGFloat
    var dimBackground : Bool
    var blurBackground : Bool
    var autoDismiss: Bool
    var animationType: AnimationType = .upToDown
    var animaionDuration : TimeInterval = 0.3
    
    public init(shadowColor:CGColor,shadowRadius:CGFloat,cornerRadius:CGFloat,shadowOpacity:CGFloat,dimBackground:Bool = true,blurBackground:Bool = false ,autoDismiss:Bool = true ,animationType:AnimationType = .upToDown ,animaionDuration :TimeInterval = 0.3 ) {
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.cornerRadius = cornerRadius
        self.shadowOpacity = shadowOpacity
        self.dimBackground = dimBackground
        self.blurBackground = blurBackground
        self.autoDismiss = autoDismiss
        self.animationType = animationType
        self.animaionDuration = animaionDuration
    }
}


