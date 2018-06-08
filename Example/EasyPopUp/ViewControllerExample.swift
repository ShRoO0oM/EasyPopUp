//
//  ViewControllerExample.swift
//  EasyPopUp_Example
//
//  Created by Mohammad Zakizadeh on 6/8/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class ViewControllerExample: UIViewController {
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var dismissButton: UIButton! {
        didSet {
            dismissButton.layer.cornerRadius = dismissButton.frame.height/2
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func dismissVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
