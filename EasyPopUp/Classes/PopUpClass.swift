//
//  PopUpClasses.swift
//  
//
//  Created by Mohammad Zakizadeh on 5/4/17.
//  Copyright © 2017 Mohammad Zakizadeh. All rights reserved.
//

import UIKit
import DynamicBlurView

public class EasyPopup {
    
    
    
    // MARK: - Views
    
    private var backView : UIView!
    public var superView : UIView
    public var popupView : UIView
    
    
    
    /// The shadow container is parent view of popup
    /// As it does not clip subviews, a shadow can be applied to it
    
    private lazy var shadowView: UIView = {
        let shadowView = UIView(frame: popupView.bounds)
        shadowView.backgroundColor = UIColor.clear
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOpacity = 0.4
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowView.layer.cornerRadius = 4
        return shadowView
    }()
    
    public var config : EasyPopupConfig
    public var blurView : DynamicBlurView?
    
    // If the interactive transition was started
    var hasStarted = false
    
    // If the interactive transition
    var shouldFinish = false
    
    public init(superView:UIView,viewTopop view:UIView, config:EasyPopupConfig = EasyPopupConfig() ) {
        
        self.superView = superView
        self.popupView = view
        self.config = config
        
        
    }
    public func showPopup(completion : ((Bool)->Void)? = nil ) {
        let CenterFrame =  CGRect(x: (superView.frame.width)/2 - (popupView.frame.width)/2,
                                  y: (superView.frame.height)/2 - (popupView.frame.height)/2,
                                  width: popupView.frame.width,
                                  height: popupView.frame.height)
        
        // preapring view with config
        if config.dimBackground {
            self.addDimView()
        }
        else {
            backView = nil
        }
        if config.autoDismiss {
            self.addTapGesture()
        }
        if config.blurBackground {
            blurView = DynamicBlurView(frame: superView.bounds)
            blurView?.blurRadius = 0
            blurView?.trackingMode = config.blurTrackingMode
            superView.addSubview(blurView!)
        }
        
        shadowView.layer.shadowRadius = config.shadowEnabled ? 5 : 0
        
        superView.addSubview(shadowView)
        shadowView.addSubview(popupView)
        superView.bringSubview(toFront: shadowView)
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        switch config.animationType {
        case .scale:
            shadowView.frame = CenterFrame
            shadowView.transform = CGAffineTransform.init(scaleX: 0.001, y: 0.001)
            UIView.animate(withDuration: config.animaionDuration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0 ,options: config.animtionOptions, animations: {
                self.backView.alpha = 0.5
                self.shadowView.transform = CGAffineTransform.identity
                self.blurView?.blurRadius = self.config.blurRadius
            }, completion : { finished in
                completion?(finished)
                UIApplication.shared.endIgnoringInteractionEvents()
            })
        case .upToDown :
            
            shadowView.frame = CGRect(x: (superView.frame.width)/2 - shadowView.frame.width/2, y: -(shadowView.frame.height), width: shadowView.frame.width, height: shadowView.frame.height)
            
            UIView.animate(withDuration: config.animaionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0 , options: config.animtionOptions , animations: {
                self.backView?.alpha = 0.5
                self.shadowView.frame = CGRect(x: (self.superView.frame.width)/2 - self.shadowView.frame.width/2,
                                              y: (self.superView.frame.height)/2 - self.shadowView.frame.height/2,
                                              width: self.shadowView.frame.width,
                                              height: self.shadowView.frame.height)
                self.blurView?.blurRadius = self.config.blurRadius
            }, completion : { finished in
                completion?(finished)
                UIApplication.shared.endIgnoringInteractionEvents()
            })
            
        case .downToUp:
            shadowView.frame = CGRect(x: (superView.frame.width)/2 - shadowView.frame.width/2, y: (superView.frame.height), width: shadowView.frame.width, height: shadowView.frame.height)
            
            UIView.animate(withDuration: config.animaionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0 , options: config.animtionOptions , animations: {
                self.backView?.alpha = 0.5
                self.shadowView.frame = CGRect(x: (self.superView.frame.width)/2 - self.shadowView.frame.width/2,
                                              y: (self.superView.frame.height)/2 - self.shadowView.frame.height/2,
                                              width: self.shadowView.frame.width,
                                              height: self.shadowView.frame.height)
                self.blurView?.blurRadius = self.config.blurRadius
            }, completion : { finished in
                completion?(finished)
                UIApplication.shared.endIgnoringInteractionEvents()
            })
        case .leftToright:
            shadowView.frame = CGRect(x: -shadowView.frame.width
                , y: (self.superView.frame.height)/2 - self.shadowView.frame.height/2
                , width: shadowView.frame.width
                , height: shadowView.frame.height)
            
            UIView.animate(withDuration: config.animaionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0 , options: config.animtionOptions , animations: {
                self.backView?.alpha = 0.5
                self.shadowView.frame = CGRect(x: (self.superView.frame.width)/2 - self.shadowView.frame.width/2,
                                              y: (self.superView.frame.height)/2 - self.shadowView.frame.height/2,
                                              width: self.shadowView.frame.width,
                                              height: self.shadowView.frame.height)
                self.blurView?.blurRadius = self.config.blurRadius
            }, completion : { finished in
                completion?(finished)
                UIApplication.shared.endIgnoringInteractionEvents()
            })
        case .rightToleft:
            shadowView.frame = CGRect(x: superView.frame.width
                , y: (self.superView.frame.height)/2 - self.shadowView.frame.height/2
                , width: shadowView.frame.width
                , height: shadowView.frame.height)
            
            UIView.animate(withDuration: config.animaionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0 , options: config.animtionOptions , animations: {
                self.backView?.alpha = 0.5
                self.shadowView.frame = CGRect(x: (self.superView.frame.width)/2 - self.shadowView.frame.width/2,
                                              y: (self.superView.frame.height)/2 - self.shadowView.frame.height/2,
                                              width: self.shadowView.frame.width,
                                              height: self.shadowView.frame.height)
                self.blurView?.blurRadius = self.config.blurRadius
            }, completion : { finished in
                completion?(finished)
                UIApplication.shared.endIgnoringInteractionEvents()
            })
        case .immediate:
            self.backView?.alpha = 0.5
            self.shadowView.frame = CGRect(x: (self.superView.frame.width)/2 - self.shadowView.frame.width/2,
                                          y: (self.superView.frame.height)/2 - self.shadowView.frame.height/2,
                                          width: self.shadowView.frame.width,
                                          height: self.shadowView.frame.height)
            self.blurView?.blurRadius = self.config.blurRadius
            UIApplication.shared.endIgnoringInteractionEvents()
        }
        popupView.layer.cornerRadius = config.cornerRadius
        popupView.clipsToBounds = true
    }
    public func removePopup(completion : ((Bool)->Void)? = nil ){
        
        switch config.animationType {
            
        case .upToDown :
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions , animations: {
                self.shadowView.frame = CGRect(x: (self.superView.frame.width)/2 - self.shadowView.frame.width/2,
                                              y: self.superView.frame.height,
                                              width: self.shadowView.frame.width,
                                              height: self.shadowView.frame.height)
                self.backView?.alpha = 0
                self.blurView?.blurRadius = 0
            }) { (finished) in
                completion?(finished)
                self.blurView?.removeFromSuperview()
                self.shadowView.removeFromSuperview()
                self.backView?.removeFromSuperview()
            }
        case .downToUp:
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions , animations: {
                self.shadowView.frame = CGRect(x: (self.superView.frame.width)/2 - self.shadowView.frame.width/2,
                                              y: -self.shadowView.frame.height,
                                              width: self.shadowView.frame.width,
                                              height: self.shadowView.frame.height)
                self.backView?.alpha = 0
                self.blurView?.blurRadius = 0
            }) { (finished) in
                completion?(finished)
                self.blurView?.removeFromSuperview()
                self.shadowView.removeFromSuperview()
                self.backView?.removeFromSuperview()
            }
        case .scale:
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions , animations: {
                self.shadowView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                self.backView?.alpha = 0
                self.blurView?.blurRadius = 0
            }) { (finished) in
                completion?(finished)
                self.shadowView.transform = CGAffineTransform.identity
                self.blurView?.removeFromSuperview()
                self.shadowView.removeFromSuperview()
                self.backView?.removeFromSuperview()
            }
        case .leftToright :
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions , animations: {
                self.shadowView.frame = CGRect(x: self.superView.frame.width,
                                              y: (self.superView.frame.height)/2 - self.shadowView.frame.height/2,
                                              width: self.shadowView.frame.width,
                                              height: self.shadowView.frame.height)
                self.backView?.alpha = 0
                self.blurView?.blurRadius = 0
            }) { (finished) in
                completion?(finished)
                self.blurView?.removeFromSuperview()
                self.shadowView.removeFromSuperview()
                self.backView?.removeFromSuperview()
            }
        case .rightToleft:
            UIView.animate(withDuration: config.animaionDuration, delay: 0 , options: config.animtionOptions , animations: {
                self.shadowView.frame = CGRect(x: -self.shadowView.frame.width,
                                              y: (self.superView.frame.height)/2 - self.shadowView.frame.height/2,
                                              width: self.shadowView.frame.width,
                                              height: self.shadowView.frame.height)
                self.backView?.alpha = 0
                self.blurView?.blurRadius = 0
            }) { (finished) in
                completion?(finished)
                self.blurView?.removeFromSuperview()
                self.shadowView.removeFromSuperview()
                self.backView?.removeFromSuperview()
            }
        case .immediate :
            self.backView?.alpha = 0
            self.blurView?.blurRadius = 0
            self.blurView?.removeFromSuperview()
            self.shadowView.removeFromSuperview()
            self.backView?.removeFromSuperview()
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
        removePopup()
    }
}

