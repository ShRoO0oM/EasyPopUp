
//
//  EeasyViewControllerPopup.swift
//  DynamicBlurView
//
//  Created by Mohammad Zakizadeh on 6/8/18.
//

import UIKit
import DynamicBlurView


public class EasyViewControllerPopup: NSObject {
    
    
    // MARK: - Views
    
    private var backView : UIView!
    public var popupView : UIView!
    public var config : EasyPopupConfig
    public var blurView : DynamicBlurView?
    
    public var sourceVC : UIViewController
    public var destinationVC : UIViewController
    
    private var isPresenting = false
    
    
    /// The shadow container is parent view of popup
    /// As it does not clip subviews, a shadow can be applied to it
    
    private lazy var shadowView: UIView = {
        let shadowView = UIView()
        shadowView.backgroundColor = UIColor.clear
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOpacity = 0.4
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowView.layer.cornerRadius = 4
        return shadowView
    }()
    
    public init(sourceViewController:UIViewController,destinationViewController:UIViewController, config: EasyPopupConfig = EasyPopupConfig()) {
        self.sourceVC = sourceViewController
        self.destinationVC = destinationViewController
        self.config = config
        
    }
    public func showVCAsPopup(){
        if destinationVC as? EasyPopUpViewControllerDatasource == nil {
            fatalError("ERROR: \(destinationVC) does not conform to protocol 'EasyPopUpViewControllerDatasource'")
        }
        self.sourceVC.transitioningDelegate = self
        self.destinationVC.transitioningDelegate = self
        destinationVC.modalPresentationStyle = .overCurrentContext
        sourceVC.present(destinationVC, animated: true, completion: nil)
    }
    private func animatePresent(transitionContext: UIViewControllerContextTransitioning) {
        guard let presentedViewController = transitionContext.viewController(forKey: .to)
            else {return}
        guard let destinationVCDatasource = presentedViewController as? EasyPopUpViewControllerDatasource else {return}
        
        self.popupView = destinationVCDatasource.popupView
        
        let contextView = transitionContext.containerView
        
        let CenterFrame =  CGRect(x: (contextView.frame.width)/2 - (popupView.frame.width)/2,
                                  y: (contextView.frame.height)/2 - (popupView.frame.height)/2,
                                  width: popupView.frame.width,
                                  height: popupView.frame.height)
        shadowView.frame = CenterFrame
        // preapring view with config
        if config.dimBackground {
            self.addDimView(to: contextView)
        }
        else {
            backView = nil
        }
        if config.autoDismiss {
            self.addTapGesture(to: contextView)
        }
        if config.blurBackground {
            blurView = DynamicBlurView(frame: sourceVC.view.bounds)
            blurView?.blurRadius = 0
            blurView?.trackingMode = config.blurTrackingMode
            sourceVC.view.addSubview(blurView!)
        }
        shadowView.layer.shadowRadius = config.shadowEnabled ? 5 : 0
        
        contextView.addSubview(shadowView)
        shadowView.addSubview(popupView)
        popupView.fillToSuperview()
 
        
        switch config.animationType {
        case .scale:
            shadowView.frame = CenterFrame
            shadowView.transform = CGAffineTransform.init(scaleX: 0.001, y: 0.001)
            UIView.animate(withDuration: config.animaionDuration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6 ,options: config.animtionOptions, animations: {
                self.backView.alpha = 0.5
                self.shadowView.transform = CGAffineTransform.identity
                self.blurView?.blurRadius = self.config.blurRadius
            }, completion : { finished in
                transitionContext.completeTransition(finished)
            })
        case .upToDown :
            
            shadowView.frame = CGRect(x: (contextView.frame.width)/2 - shadowView.frame.width/2, y: -(shadowView.frame.height), width: shadowView.frame.width, height: shadowView.frame.height)
            
            UIView.animate(withDuration: config.animaionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0 , options: config.animtionOptions , animations: {
                self.backView?.alpha = 0.5
                self.shadowView.frame = CGRect(x: (contextView.frame.width)/2 - self.shadowView.frame.width/2,
                                               y: (contextView.frame.height)/2 - self.shadowView.frame.height/2,
                                               width: self.shadowView.frame.width,
                                               height: self.shadowView.frame.height)
                self.blurView?.blurRadius = self.config.blurRadius
            }, completion : { finished in
                transitionContext.completeTransition(finished)
            })
    
        case .downToUp:
            shadowView.frame = CGRect(x: (contextView.frame.width)/2 - shadowView.frame.width/2, y: (contextView.frame.height), width: shadowView.frame.width, height: shadowView.frame.height)
            
            UIView.animate(withDuration: config.animaionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0 , options: config.animtionOptions , animations: {
                self.backView?.alpha = 0.5
                self.shadowView.frame = CGRect(x: (contextView.frame.width)/2 - self.shadowView.frame.width/2,
                                               y: (contextView.frame.height)/2 - self.shadowView.frame.height/2,
                                               width: self.shadowView.frame.width,
                                               height: self.shadowView.frame.height)
                self.blurView?.blurRadius = self.config.blurRadius
            }, completion : { finished in
                transitionContext.completeTransition(finished)
            })
        case .leftToright:
            shadowView.frame = CGRect(x: -shadowView.frame.width
                , y: (contextView.frame.height)/2 - self.shadowView.frame.height/2
                , width: shadowView.frame.width
                , height: shadowView.frame.height)
            
            UIView.animate(withDuration: config.animaionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0 , options: config.animtionOptions , animations: {
                self.backView?.alpha = 0.5
                self.shadowView.frame = CGRect(x: (contextView.frame.width)/2 - self.shadowView.frame.width/2,
                                               y: (contextView.frame.height)/2 - self.shadowView.frame.height/2,
                                               width: self.shadowView.frame.width,
                                               height: self.shadowView.frame.height)
                self.blurView?.blurRadius = self.config.blurRadius
            }, completion : { finished in
                transitionContext.completeTransition(finished)
            })
        case .rightToleft:
            shadowView.frame = CGRect(x: contextView.frame.width
                , y: (contextView.frame.height)/2 - self.shadowView.frame.height/2
                , width: shadowView.frame.width
                , height: shadowView.frame.height)
            
            UIView.animate(withDuration: config.animaionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0 , options: config.animtionOptions , animations: {
                self.backView?.alpha = 0.5
                self.shadowView.frame = CGRect(x: (contextView.frame.width)/2 - self.shadowView.frame.width/2,
                                               y: (contextView.frame.height)/2 - self.shadowView.frame.height/2,
                                               width: self.shadowView.frame.width,
                                               height: self.shadowView.frame.height)
                self.blurView?.blurRadius = self.config.blurRadius
            }, completion : { finished in
                transitionContext.completeTransition(finished)
            })
        case .immediate:
            self.backView?.alpha = 0.5
            self.shadowView.frame = CGRect(x: (contextView.frame.width)/2 - self.shadowView.frame.width/2,
                                           y: (contextView.frame.height)/2 - self.shadowView.frame.height/2,
                                           width: self.shadowView.frame.width,
                                           height: self.shadowView.frame.height)
            self.blurView?.blurRadius = self.config.blurRadius
            transitionContext.completeTransition(true)
        }
        popupView.layer.cornerRadius = config.cornerRadius
        popupView.clipsToBounds = true
    }
    private func animateDismiss(transitionContext: UIViewControllerContextTransitioning) {
        
        let contextView = transitionContext.containerView
        
        switch config.animationType {
        case .upToDown :
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions , animations: {
                self.shadowView.frame = CGRect(x: (contextView.frame.width)/2 - self.shadowView.frame.width/2,
                                               y: contextView.frame.height,
                                               width: self.shadowView.frame.width,
                                               height: self.shadowView.frame.height)
                self.backView?.alpha = 0
                self.blurView?.blurRadius = 0
            }) { (finished) in
                transitionContext.completeTransition(finished)
                self.blurView?.removeFromSuperview()
                self.shadowView.removeFromSuperview()
                self.backView?.removeFromSuperview()
            }
        case .downToUp:
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions , animations: {
                self.shadowView.frame = CGRect(x: (contextView.frame.width)/2 - self.shadowView.frame.width/2,
                                               y: -self.shadowView.frame.height,
                                               width: self.shadowView.frame.width,
                                               height: self.shadowView.frame.height)
                self.backView?.alpha = 0
                self.blurView?.blurRadius = 0
            }) { (finished) in
                transitionContext.completeTransition(finished)
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
                transitionContext.completeTransition(finished)
                self.shadowView.transform = CGAffineTransform.identity
                self.blurView?.removeFromSuperview()
                self.shadowView.removeFromSuperview()
                self.backView?.removeFromSuperview()
            }
        case .leftToright :
            UIView.animate(withDuration: config.animaionDuration, delay: 0, options: config.animtionOptions , animations: {
                self.shadowView.frame = CGRect(x: contextView.frame.width,
                                               y: (contextView.frame.height)/2 - self.shadowView.frame.height/2,
                                               width: self.shadowView.frame.width,
                                               height: self.shadowView.frame.height)
                self.backView?.alpha = 0
                self.blurView?.blurRadius = 0
            }) { (finished) in
                transitionContext.completeTransition(finished)
                self.blurView?.removeFromSuperview()
                self.shadowView.removeFromSuperview()
                self.backView?.removeFromSuperview()
            }
        case .rightToleft:
            UIView.animate(withDuration: config.animaionDuration, delay: 0 , options: config.animtionOptions , animations: {
                self.shadowView.frame = CGRect(x: -self.shadowView.frame.width,
                                               y: (contextView.frame.height)/2 - self.shadowView.frame.height/2,
                                               width: self.shadowView.frame.width,
                                               height: self.shadowView.frame.height)
                self.backView?.alpha = 0
                self.blurView?.blurRadius = 0
            }) { (finished) in
                transitionContext.completeTransition(finished)
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
            transitionContext.completeTransition(true)
        }
    }
    
    // adding dimView to superView
    private func addDimView(to view:UIView){
        backView = UIView(frame: view.bounds)
        view.addSubview(backView)
        backView.backgroundColor = UIColor.darkGray
        backView.alpha = 0
        backView.isOpaque = true
    }
    // adding tapGesture to dismiss popupView
    private func addTapGesture(to view:UIView){
        if backView == nil {
            backView = UIView(frame: view.bounds)
            view.addSubview(backView)
            backView.backgroundColor = .clear
        }
        backView.addTapGestureRecognizer(action: RemovepopupFromBlackView)
    }
    /// function for removing popup on tapping of superview
    @objc private func RemovepopupFromBlackView(){
        destinationVC.dismiss(animated: true, completion: nil)
    }
}
extension EasyViewControllerPopup : UIViewControllerAnimatedTransitioning {
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            self.animatePresent(transitionContext: transitionContext)
        }
        else {
            self.animateDismiss(transitionContext: transitionContext)
        }
    }
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return config.animaionDuration
    }
}
extension EasyViewControllerPopup : UIViewControllerTransitioningDelegate {
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = true
        return self
    }
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = false
        return self
    }
}
extension UIView {
    public func fillToSuperview() {
        // https://videos.letsbuildthatapp.com/
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
}
