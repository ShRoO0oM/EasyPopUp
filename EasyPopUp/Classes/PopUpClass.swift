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
    
    
    
    
    private var blurView : DynamicBlurView?
    private var blackView : UIView?
    private var superView : UIView
    private var popupView : UIView
    private var config : EasyPopupConfig
    
    
    public init(superView:UIView,viewTopop view:UIView, config:EasyPopupConfig) {

        self.superView = superView
        self.popupView = view
        self.config = config
        
    
    }
    
    
    //
    public func Showpopup(completion : ((Bool)->Void)?) {
        let CenterFrame =  CGRect(x: (superView.frame.width)/2 - (popupView.frame.width)/2,
                                  y: (superView.frame.height)/2 - (popupView.frame.height)/2,
                                  width: popupView.frame.width,
                                  height: popupView.frame.height)
        // preapring view with config file
        superView.addSubview(popupView)
        superView.bringSubview(toFront: popupView)
        if config.dimBackground {
            self.addDimView()
        }
        if config.autoDismiss {
            self.addTapGesture()
        }
        if config.blurBackground {
            //            blurView = DynamicBlurView(frame: (popup.superview!.bounds))
            //            blurView?.blurRadius = 0
            //            blurView?.drawsAsynchronously = true
            //            blurView?.trackingMode = .common
            //          self.popupview!.superview!.addSubview(blurView!)
        }
        switch config.animationType {
        case .scale:
            popupView.frame = CenterFrame
            popupView.transform = CGAffineTransform.init(scaleX: 0.001, y: 0.001)
            UIView.animate(withDuration: config.animaionDuration, animations: {
                self.popupView.transform = CGAffineTransform.identity
                if self.config.blurBackground {
                    //  self.blurView?.blurRadius = 10
                }
            }, completion : completion)
        case .upToDown :
            
            popupView.frame = CGRect(x: (superView.frame.width)/2 - popupView.frame.width/2, y: -(popupView.frame.height), width: popupView.frame.width, height: popupView.frame.height)
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut , animations: {
                self.popupView.frame = CGRect(x: (self.superView.frame.width)/2 - self.popupView.frame.width/2,
                                     y: (self.superView.frame.height)/2 - self.popupView.frame.height/2,
                                     width: self.popupView.frame.width,
                                     height: self.popupView.frame.height)
                if self.config.blurBackground {
                    //  self.blurView?.blurRadius = 10
                }
            }, completion: completion)
            
            break
        default :
            break
        }
        
        //        popup.addShadowForRoundedButton(withCorner: 10)
        //        popup.layer.cornerRadius = 5
        //        popup.layer.borderColor = UIColor.clear.cgColor
        //        popup.layer.borderWidth = 0.5
        //        popup.layer.shadowOffset = CGSize(width: 5, height: 5)
        //        popup.layer.shadowOpacity = 10
        //        popup.layer.shadowRadius = 5
        //        popup.layer.shadowColor = UIColor.darkGray.cgColor
        
        
    }
    //    func RemovePopUp(popup:UIView,animation:AnimationType = .UP,callback: (@escaping (Bool)->Void) = {_ in }){
    //        guard let _ = popup.superview else {
    //            return
    //        }
    //        switch animation {
    //        case .Immediate:
    //            // no animation and remove from superview
    //            for subview in (popup.superview?.subviews)! {
    //                if subview.tag == 5 {
    //                    popup.removeFromSuperview()
    //                    subview.removeFromSuperview()
    //                }
    //            }
    //          //  self.blurView?.removeFromSuperview()
    //            callback(true)
    //            return
    //        case .compress:
    //            print("not supported yet")
    //            break
    //        case .Scale:
    //            UIView.animate(withDuration: 0.5, animations: {
    //                popup.transform = CGAffineTransform.init(scaleX: 0.001, y: 0.001)
    //            }, completion: { (isfinished) in
    //                if isfinished {
    //
    //                }
    //            })
    //            break
    //        case .UP :
    //
    //            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut , animations: {
    //                popup.frame = CGRect(x: popup.frame.origin.x,
    //                                     y: (popup.superview?.frame.maxY)!,
    //                                     width: popup.frame.width,
    //                                     height: popup.frame.height)
    //            }, completion: { finished in
    //
    //            })
    //
    //            break
    //        }
    //        print(popup.frame)
    //        for subview in (popup.superview?.subviews)! {
    //            if subview.tag == 5 {
    //                UIView.animate(withDuration: 1, animations:{subview.alpha = 0}, completion: { (isfinished) in
    //                        subview.removeFromSuperview()
    //                        popup.removeFromSuperview()
    //                    print(isfinished)
    //                })
    //            }
    //        }
    // //       self.blurView?.removeFromSuperview()
    //        callback(true)
    //}
    // adding dimView to superView
    private func addDimView(){
        blackView = UIView(frame: superView.bounds)
        blackView?.backgroundColor = UIColor.darkGray
        blackView?.alpha = 0.5
        blackView?.isOpaque = true
    }
    // adding tapGesture to dismiss popupView
    private func addTapGesture(){
        superView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(RemovepopupFromBlackView)))
    }
    // function for removing popup on tapping of superview
    @objc private func RemovepopupFromBlackView(){
        self.popupView.alpha = 0
        UIView.animate(withDuration: config.animaionDuration, animations: {
            self.blackView?.alpha = 0
        }, completion: { (isfinished) in
                self.popupView.removeFromSuperview()
                self.blackView?.removeFromSuperview()
        })
    }
    
}

