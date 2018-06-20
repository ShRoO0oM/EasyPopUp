//
//  ViewControllerExample.swift
//  EasyPopUp_Example
//
//  Created by Mohammad Zakizadeh on 6/8/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import EasyPopUp

class ViewControllerExample: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var popupContentView: UIView! {
        didSet {
            popupContentView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var dismissButton: UIButton! {
        didSet {
            dismissButton.layer.cornerRadius = dismissButton.frame.height/2
        }
    }
    @IBAction func dismissVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ViewControllerExample : EasyPopUpViewControllerDatasource {
    var popupView: UIView {
        return popupContentView
    }
}
