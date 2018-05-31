//
//  PopUpcClasses.swift
//  
//
//  Created by Mohammad Zakizadeh on 5/4/17.
//  Copyright © 2017 Mohammad Zakizadeh. All rights reserved.
//

import UIKit
import DynamicBlurView

public class EasyPopup {
    
    
    
    
    
    private var backView : UIView!
    private var superView : UIView
    private var popupView : UIView
    
    public var config : EasyPopupConfig
    public var blurView : DynamicBlurView?
    
    
    public init(superView:UIView,viewTopop view:UIView, config:EasyPopupConfig = EasyPopupConfig() ) {
        
        self.superView = superView
        self.popupView = view
        self.config = config
        
        
    }
    public func Showpopup(completion : ((Bool)->Void)?) {
        let CenterFrame =  CGRect(x: (superView.frame.width)/2 - (popupView.frame.width)/2,
                                  y: (superView.frame.height)/2 - (popupView.frame.height)/2,
                                  width: popupView.frame.width,
                                  height: popupView.frame.height)
        // preapring view with config file
        
        if config.dimBackground {
            self.addDimView()
        }
        if config.autoDismiss {
            self.addTapGesture()
        }
        if config.blurBackground {
            blurView = DynamicBlurView(frame: superView.bounds)
            blurView?.blurRadius = 0
            blurView?.trackingMode = .common
            superView.addSubview(blurView!)
        }
        superView.addSubview(popupView)
        superView.bringSubview(toFront: popupView)
        switch config.animationType {
        case .scale:
            popupView.frame = CenterFrame
            popupView.transform = CGAffineTransform.init(scaleX: 0.001, y: 0.001)
            UIView.animate(withDuration: config.animaionDuration, delay: 0 ,options: config.animtionOptions, animations: {
                self.backView.alpha = 0.5
                self.popupView.transform = CGAffineTransform.identity
                self.blurView?.blurRadius = 10
            }, completion : completion)
        case .upToDown :
            
            popupView.frame = CGRect(x: (superView.frame.width)/2 - popupView.frame.width/2, y: -(popupView.frame.height), width: popupView.frame.width, height: popupView.frame.height)
            
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions , animations: {
                self.backView?.alpha = 0.5
                self.popupView.frame = CGRect(x: (self.superView.frame.width)/2 - self.popupView.frame.width/2,
                                              y: (self.superView.frame.height)/2 - self.popupView.frame.height/2,
                                              width: self.popupView.frame.width,
                                              height: self.popupView.frame.height)
                self.blurView?.blurRadius = 10
            }, completion: completion)
            
            break
        case .downToUp:
            popupView.frame = CGRect(x: (superView.frame.width)/2 - popupView.frame.width/2, y: (superView.frame.height), width: popupView.frame.width, height: popupView.frame.height)
            
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions , animations: {
                self.backView?.alpha = 0.5
                self.popupView.frame = CGRect(x: (self.superView.frame.width)/2 - self.popupView.frame.width/2,
                                              y: (self.superView.frame.height)/2 - self.popupView.frame.height/2,
                                              width: self.popupView.frame.width,
                                              height: self.popupView.frame.height)
                self.blurView?.blurRadius = 10
            }, completion: completion)
        case .leftToright:
            popupView.frame = CGRect(x: -popupView.frame.width
                , y: (self.superView.frame.height)/2 - self.popupView.frame.height/2
                , width: popupView.frame.width
                , height: popupView.frame.height)
            
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions , animations: {
                self.backView?.alpha = 0.5
                self.popupView.frame = CGRect(x: (self.superView.frame.width)/2 - self.popupView.frame.width/2,
                                              y: (self.superView.frame.height)/2 - self.popupView.frame.height/2,
                                              width: self.popupView.frame.width,
                                              height: self.popupView.frame.height)
                self.blurView?.blurRadius = 10
            }, completion: completion)
        case .rightToleft:
            popupView.frame = CGRect(x: superView.frame.width
                , y: (self.superView.frame.height)/2 - self.popupView.frame.height/2
                , width: popupView.frame.width
                , height: popupView.frame.height)
            
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions , animations: {
                self.backView?.alpha = 0.5
                self.popupView.frame = CGRect(x: (self.superView.frame.width)/2 - self.popupView.frame.width/2,
                                              y: (self.superView.frame.height)/2 - self.popupView.frame.height/2,
                                              width: self.popupView.frame.width,
                                              height: self.popupView.frame.height)
                self.blurView?.blurRadius = 10
            }, completion: completion)
        case .immediate:
            self.backView?.alpha = 0.5
            self.popupView.frame = CGRect(x: (self.superView.frame.width)/2 - self.popupView.frame.width/2,
                                          y: (self.superView.frame.height)/2 - self.popupView.frame.height/2,
                                          width: self.popupView.frame.width,
                                          height: self.popupView.frame.height)
            self.blurView?.blurRadius = 10
        }
        popupView.layer.cornerRadius = config.cornerRadius
        
        
        //        popup.addShadowForRoundedButton(withCorner: 10)
        //        popup.layer.cornerRadius = 5
        //        popup.layer.borderColor = UIColor.clear.cgColor
        //        popup.layer.borderWidth = 0.5
        //        popup.layer.shadowOffset = CGSize(width: 5, height: 5)
        //        popup.layer.shadowOpacity = 10
        //        popup.layer.shadowRadius = 5
        //        popup.layer.shadowColor = UIColor.darkGray.cgColor
        
        
    }
    public func RemovePopUp(completion : ((Bool)->Void)? ){
        
        switch config.animationType {
            
        case .upToDown :
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions, animations: {
                self.popupView.frame = CGRect(x: (self.superView.frame.width)/2 - self.popupView.frame.width/2,
                                              y: self.superView.frame.height,
                                              width: self.popupView.frame.width,
                                              height: self.popupView.frame.height)
                self.backView?.alpha = 0
                self.blurView?.blurRadius = 0
            }) { (finished) in
                completion?(finished)
                self.blurView?.removeFromSuperview()
                self.popupView.removeFromSuperview()
                self.backView.removeFromSuperview()
            }
        case .downToUp:
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions, animations: {
                self.popupView.frame = CGRect(x: (self.superView.frame.width)/2 - self.popupView.frame.width/2,
                                              y: -self.popupView.frame.height,
                                              width: self.popupView.frame.width,
                                              height: self.popupView.frame.height)
                self.backView?.alpha = 0
                self.blurView?.blurRadius = 0
            }) { (finished) in
                completion?(finished)
                self.blurView?.removeFromSuperview()
                self.popupView.removeFromSuperview()
                self.backView.removeFromSuperview()
            }
        case .scale:
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions, animations: {
                self.popupView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                self.backView?.alpha = 0
                self.blurView?.blurRadius = 0
            }) { (finished) in
                completion?(finished)
                self.popupView.transform = CGAffineTransform.identity
                self.blurView?.removeFromSuperview()
                self.popupView.removeFromSuperview()
                self.backView.removeFromSuperview()
            }
        case .leftToright :
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions, animations: {
                self.popupView.frame = CGRect(x: self.superView.frame.width,
                                              y: (self.superView.frame.height)/2 - self.popupView.frame.height/2,
                                              width: self.popupView.frame.width,
                                              height: self.popupView.frame.height)
                self.backView?.alpha = 0
                self.blurView?.blurRadius = 0
            }) { (finished) in
                completion?(finished)
                self.blurView?.removeFromSuperview()
                self.popupView.removeFromSuperview()
                self.backView.removeFromSuperview()
            }
        case .rightToleft:
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions, animations: {
                self.popupView.frame = CGRect(x: -self.popupView.frame.width,
                                              y: (self.superView.frame.height)/2 - self.popupView.frame.height/2,
                                              width: self.popupView.frame.width,
                                              height: self.popupView.frame.height)
                self.backView?.alpha = 0
                self.blurView?.blurRadius = 0
            }) { (finished) in
                completion?(finished)
                self.blurView?.removeFromSuperview()
                self.popupView.removeFromSuperview()
                self.backView.removeFromSuperview()
            }
        case .immediate :
            self.backView?.alpha = 0
            self.blurView?.blurRadius = 0
            self.blurView?.removeFromSuperview()
            self.popupView.removeFromSuperview()
            self.backView.removeFromSuperview()
        }
    }
    
    // adding dimView to superView
    private func addDimView(){
        backView = UIView(frame: superView.bounds)
        superView.addSubview(backView)
        backView.backgroundColor = UIColor.darkGray
        backView.alpha = 0
        backView.isOpaque = true
    }
    // adding tapGesture to dismiss popupView
    private func addTapGesture(){
        if backView == nil {
            backView = UIView(frame: superView.bounds)
            superView.addSubview(backView)
            backView.backgroundColor = .clear
        }
        backView.addTapGestureRecognizer(action: RemovepopupFromBlackView)
    }
    /// function for removing popup on tapping of superview
    @objc private func RemovepopupFromBlackView(){
        RemovePopUp(completion: nil)
    }
}
