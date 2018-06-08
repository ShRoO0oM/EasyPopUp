
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
    public var config : EasyPopupConfig
    public var blurView : DynamicBlurView?
    
    public var sourceVC : UIViewController
    public var destinationVC : UIViewController
    
    private var visualEffectBlurView = UIVisualEffectView()
    
    
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
        self.sourceVC.transitioningDelegate = self
        self.destinationVC.transitioningDelegate = self
        destinationVC.modalPresentationStyle = .overCurrentContext
        sourceVC.present(destinationVC, animated: true, completion: nil)
    }
}
extension EasyViewControllerPopup : UIViewControllerTransitioningDelegate {
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}
extension EasyViewControllerPopup : UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return config.animaionDuration
    }
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let presentedViewController = transitionContext.viewController(forKey: .to)
            else {return}
        presentedViewController.view.alpha = 0
        presentedViewController.view.frame = transitionContext.containerView.bounds
        
        transitionContext.containerView.addSubview(presentedViewController.view)
        
        visualEffectBlurView.frame = transitionContext.containerView.bounds
        visualEffectBlurView.alpha = 1
        
        transitionContext.containerView.insertSubview(visualEffectBlurView, at: 0)
        visualEffectBlurView.translatesAutoresizingMaskIntoConstraints = false
        
        transitionContext.containerView.addConstraints([
            NSLayoutConstraint(item: visualEffectBlurView, attribute: .bottom, relatedBy: .equal,
                               toItem: transitionContext.containerView, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: visualEffectBlurView, attribute: .top, relatedBy: .equal,
                               toItem: transitionContext.containerView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: visualEffectBlurView, attribute: .leading, relatedBy: .equal,
                               toItem: transitionContext.containerView, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: visualEffectBlurView, attribute: .trailing, relatedBy: .equal,
                               toItem: transitionContext.containerView, attribute: .trailing, multiplier: 1, constant: 0)
            ])
        
        presentedViewController.view.alpha = 0
        
        // blur view animation workaround: need that to avoid the "blur-flashes"
        UIView.animate(withDuration: transitionDuration(using: transitionContext) * 0.75) {
            self.visualEffectBlurView.effect = UIBlurEffect(style: .light)
        }
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            delay: 0.0,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 0.0,
            options: .allowUserInteraction,
            animations: {
                presentedViewController.view.alpha = 1
                presentedViewController.view.alpha = 1
                presentedViewController.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        },
            completion: { isCompleted in
                transitionContext.completeTransition(isCompleted)
        }
        )
        
    }
}
