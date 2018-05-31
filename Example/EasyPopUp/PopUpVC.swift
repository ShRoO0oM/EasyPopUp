//
//  ViewController.swift
//  EasyPopUp
//
//  Created by Mohammad on 05/30/2018.
//  Copyright (c) 2018 Mohammad. All rights reserved.
//

import UIKit
import EasyPopUp


class PopUpVC: UIViewController {

    @IBOutlet var viewToPop: UIView!
    

    @IBAction func showPopUpDownToUp(_ sender: Any) {
     
        
    }
    @IBAction func showPopUpUpToDown(_ sender: Any) {
        let config = EasyPopupConfig(shadowColor: UIColor.red.cgColor, shadowRadius: 0, cornerRadius: 0, shadowOpacity: 0, dimBackground: true, blurBackground: false, autoDismiss: true, animationType: .upToDown, animaionDuration: 0.4)
        
        let popUpView = EasyPopup(superView: self.view, viewTopop: viewToPop, config: config)
        
        popUpView.Showpopup { (isfinished) in
            print(isfinished)
        }
    }
    @IBAction func removePopUp(_ sender: Any) {
        
    }
    
}

