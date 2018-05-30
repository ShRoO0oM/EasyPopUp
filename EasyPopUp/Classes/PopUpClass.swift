//
//  PopUpcClasses.swift
//  
//
//  Created by Mohammad Zakizadeh on 5/4/17.
//  Copyright © 2017 Mohammad Zakizadeh. All rights reserved.
//

import UIKit
import DynamicBlurView

public class PopUpClass {
    
    
    enum AnimationType : String {
        case Scale = "Scale"
        case UP = "Up"
        case compress = "compress"
        case Immediate = "Immediate"
    }
    var popupview : UIView?
    static public var instance = PopUpClass()
    var CenterFrame : CGRect!
    public var blurView : DynamicBlurView?
    
    @nonobjc static let TheScreen = UIScreen.main.bounds
    @objc private func RemovepopupFromBlackView(gesture:UITapGestureRecognizer){
        if popupview == nil {
            return
        }
        popupview?.frame = CGRect(x: PopUpClass.TheScreen.width/2 - (popupview?.frame.width)!/2
            , y: (popupview?.TheScreen.origin.y)! - (popupview?.frame.height)!,
              width: (popupview?.frame.width)!,
              height: (popupview?.frame.height)!)
        for subview in (popupview?.superview?.subviews)! {
            if subview.tag == 5 {
                UIView.animate(withDuration: 1, animations:{subview.alpha = 0}, completion: { (isfinished) in
                    if isfinished {
                        subview.removeFromSuperview()
                        self.popupview?.removeFromSuperview()
         //               self.blurView?.removeFromSuperview()
                    }
                })
            }
        }
    }
    func Showpopup(popup:UIView,AutoDissmis:Bool = true,animation:AnimationType = .UP,WithBlur : Bool = false ,completion :(@escaping (Bool)->Void) = {_ in }) {
        popupview = popup
        CenterFrame =  CGRect(x: (popup.superview?.frame.width)!/2 - popup.frame.width/2,
                              y: (popup.superview?.frame.height)!/2 - popup.frame.height/2,
                              width: popup.frame.width,
                              height: popup.frame.height)
        var blackview = UIView()
  //      blackview = UIView(frame: popup.TheScreen)
        popup.superview?.addSubview(blackview)
        blackview.backgroundColor = UIColor.darkGray
        blackview.alpha = 0.5
        blackview.tag = 5
        blackview.isOpaque = true
        if AutoDissmis {
        blackview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.RemovepopupFromBlackView)))
        }
        if WithBlur {
//            blurView = DynamicBlurView(frame: (popup.superview!.bounds))
//            blurView?.blurRadius = 0
//            blurView?.drawsAsynchronously = true
//            blurView?.trackingMode = .common
  //          self.popupview!.superview!.addSubview(blurView!)
        }
        switch animation {
            
        case .compress:
            print("not supported")
            break
        case .Scale:
            popup.frame = CenterFrame
            popup.transform = CGAffineTransform.init(scaleX: 0.001, y: 0.001)
            UIView.animate(withDuration: 0.3, animations: { 
                popup.transform = CGAffineTransform.identity
                if WithBlur {
//                    self.blurView?.blurRadius = 10
                }
            }, completion : completion)
            break
        case .UP :
            popup.frame = CGRect(x: (popup.superview?.frame.width)!/2 - popup.frame.width/2, y: -(popup.frame.height), width: popup.frame.width, height: popup.frame.height)
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut , animations: {
                popup.frame = CGRect(x: (popup.superview?.frame.width)!/2 - popup.frame.width/2,
                                     y: (popup.superview?.frame.height)!/2 - popup.frame.height/2,
                                     width: popup.frame.width,
                                     height: popup.frame.height)
                if WithBlur {
//                    self.blurView?.blurRadius = 10
                }
            }, completion: completion)
            
            break
         default :
            break
        }
        popup.superview?.bringSubview(toFront: popup)
        
  //      popup.addShadowForRoundedButton(withCorner: 10)
        popup.layer.cornerRadius = 5
//        popup.layer.borderColor = UIColor.clear.cgColor
//        popup.layer.borderWidth = 0.5
//        popup.layer.shadowOffset = CGSize(width: 5, height: 5)
//        popup.layer.shadowOpacity = 10
//        popup.layer.shadowRadius = 5
//        popup.layer.shadowColor = UIColor.darkGray.cgColor
        
        
    }
    func RemovePopUp(popup:UIView,animation:AnimationType = .UP,callback: (@escaping (Bool)->Void) = {_ in }){
        guard let _ = popup.superview else {
            return
        }
        switch animation {
        case .Immediate:
            // no animation and remove from superview
            for subview in (popup.superview?.subviews)! {
                if subview.tag == 5 {
                    popup.removeFromSuperview()
                    subview.removeFromSuperview()
                }
            }
          //  self.blurView?.removeFromSuperview()
            callback(true)
            return
        case .compress:
            print("not supported yet")
            break
        case .Scale:
            UIView.animate(withDuration: 0.5, animations: {
                popup.transform = CGAffineTransform.init(scaleX: 0.001, y: 0.001)
            }, completion: { (isfinished) in
                if isfinished {
                    
                }
            })
            break
        case .UP :
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut , animations: {
                popup.frame = CGRect(x: popup.frame.origin.x,
                                     y: (popup.superview?.frame.maxY)!,
                                     width: popup.frame.width,
                                     height: popup.frame.height)
            }, completion: { finished in
                
            })
            
            break
        }
        print(popup.frame)
        for subview in (popup.superview?.subviews)! {
            if subview.tag == 5 {
                UIView.animate(withDuration: 1, animations:{subview.alpha = 0}, completion: { (isfinished) in
                        subview.removeFromSuperview()
                        popup.removeFromSuperview()
                    print(isfinished)
                })
            }
        }
 //       self.blurView?.removeFromSuperview()
        callback(true)
    }
//    func AnimateTovc(duration:Float = 0.5,Animateoption:UIViewAnimationOptions = .transitionFlipFromLeft,ViewControllerToAnimate vc:UIViewController,vctoDissmiss: UIViewController?,completion : @escaping ()->Void = {} ){
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        UIView.transition(with: appDelegate.window!, duration: TimeInterval(duration), options: Animateoption , animations: { () -> Void in
//            appDelegate.window!.rootViewController = vc
//        }, completion:{ isfinished in
//            completion()
//            vctoDissmiss?.dismiss(animated: false, completion: nil)
//        })
//    }
}
extension UIView {
    var TheScreen : CGRect {
        get {
            return UIScreen.main.bounds
        }
    }
}
