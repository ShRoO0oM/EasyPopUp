//
//  EasyPopupConfig.swift
//  EasyPopUp
//
//  Created by Mohammad on 5/31/18.
//

import UIKit

struct EasyPopupConfig {
    var shadowColor : CGColor
    var shadowRadius: CGFloat
    var cornerRadius: CGFloat
    var shadowOpacity : CGFloat
    var dimBackGround : Bool = true
    var blurBackground : Bool = false
    var autoDismiss: Bool = true
    var animationType: AnimationType = .upToDown
}


