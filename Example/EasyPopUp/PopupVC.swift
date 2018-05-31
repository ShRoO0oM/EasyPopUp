//
//  ViewController.swift
//  EasyPopUp
//
//  Created by Mohammad on 05/30/2018.
//  Copyright (c) 2018 Mohammad. All rights reserved.
//

import UIKit
import EasyPopUp


class PopupVC: UIViewController {

    @IBOutlet var viewToPop: UIView!
    
    var config = EasyPopupConfig(shadowColor: UIColor.red.cgColor, shadowRadius: 0, cornerRadius: 0, shadowOpacity: 0, dimBackground: true, blurBackground: true, autoDismiss: true, animationType: .upToDown, animaionDuration: 0.4)
    
    lazy var popUpView : EasyPopup = {
        let easePopUp = EasyPopup(superView: self.view, viewTopop: viewToPop, config: config)
        return easePopUp
    }()
    
    @IBAction func showPopUpDownToUp(_ sender: Any) {
        
        popUpView.config.animationType = .downToUp
        
        popUpView.Showpopup { (isfinished) in
            print(isfinished)
        }
        
    }
    
    @IBAction func showPopUpUpToDown(_ sender: Any) {
        
        popUpView.config.animationType = .upToDown
        
        popUpView.Showpopup { (isfinished) in
            print(isfinished)
        }
    }
    @IBAction func showPopupScale(_ sender: Any) {
        popUpView.config.animationType = .scale
        
        popUpView.Showpopup { (isfinished) in
            print(isfinished)
        }
    }
    @IBAction func showPopupRightToLeft(_ sender: Any) {
        popUpView.config.animationType = .rightToleft
        
        popUpView.Showpopup { (isfinished) in
            print(isfinished)
        }
    }
    @IBAction func showPopupLeftToRight(_ sender: Any) {
        popUpView.config.animationType = .leftToright
        
        popUpView.Showpopup { (isfinished) in
            print(isfinished)
        }
    }
    @IBAction func immediate(_ sender: Any) {
        popUpView.config.animationType = .immediate
        
        popUpView.Showpopup { (isfinished) in
            print(isfinished)
        }
    }
    @IBAction func removePopUp(_ sender: Any) {
        
        popUpView.RemovePopUp { (isfinished) in
            print(isfinished)
        }
    }
    
}

