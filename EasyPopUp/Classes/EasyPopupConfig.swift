//
//  EasyPopupConfig.swift
//  EasyPopUp
//
//  Created by Mohammad on 5/31/18.
//

import UIKit

public struct EasyPopupConfig {
    public var shadowColor : CGColor
    public var shadowRadius: CGFloat
    public var cornerRadius: CGFloat
    public var shadowOpacity : CGFloat
    public var dimBackground : Bool = true
    public var blurBackground : Bool = false
    public var autoDismiss: Bool = true
    public var animationType: AnimationType = .upToDown
    public var animaionDuration : TimeInterval = 0.3
}


