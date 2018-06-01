//
//  ViewController.swift
//  EasyPopUp
//
//  Created by Mohammad on 05/30/2018.
//  Copyright (c) 2018 Mohammad. All rights reserved.
//

import UIKit
import EasyPopUp


class PopupVC: UIViewController,UITextFieldDelegate {

    @IBOutlet var viewToPop: UIView!
    @IBOutlet weak var animationTypePickerView: UIPickerView!
    @IBOutlet weak var blurSegment: UISegmentedControl!
    
    @IBOutlet weak var dimBackgroundSwitch: UISwitch!
    @IBOutlet weak var shadowSwitch: UISwitch!
    @IBOutlet weak var blurSwitch: UISwitch!
    @IBOutlet weak var autoDismissSwitch: UISwitch!
    
    @IBOutlet weak var cornerRadiusTF: UITextField!
    @IBOutlet weak var blurRadiusTF: UITextField!
    @IBOutlet weak var animationDurationTF: UITextField!
    
    var animationTypes = ["scale","immediate","upToDown","downToUp","rightToleft","leftToRight"]
    
    var popUpConfig = EasyPopupConfig()
    
    
    lazy var popUpView : EasyPopup = {
        let easePopUp = EasyPopup(superView: self.view, viewTopop: viewToPop)
        return easePopUp
    }()
    override func viewDidLoad() {
        self.animationTypePickerView.delegate?.pickerView!(animationTypePickerView, didSelectRow: 0, inComponent: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    @IBAction func showPopup(_ sender: Any) {
        
        let dimBackground = dimBackgroundSwitch.isOn
        popUpConfig.dimBackground = dimBackground
        
        let shadowEnabled = shadowSwitch.isOn
        popUpConfig.shadowEnabled = shadowEnabled
        
        let blurBackground = blurSwitch.isOn
        popUpConfig.blurBackground = blurBackground
        
        let autoDismiss = autoDismissSwitch.isOn
        popUpConfig.autoDismiss = autoDismiss
        
        popUpConfig.cornerRadius = cornerRadiusTF.text!.CGfloat ?? 4
        popUpConfig.blurRadius = blurRadiusTF.text!.CGfloat ?? 8
        popUpConfig.animaionDuration = Double(animationDurationTF.text!) ?? 0.4
        
        switch blurSegment.selectedSegmentIndex {
        case 0:
            popUpConfig.blurTrackingMode = .none
        case 1:
            popUpConfig.blurTrackingMode = .tracking
        case 2:
            popUpConfig.blurTrackingMode = .common
        default:
            break
        }
        
        popUpView.config = popUpConfig
        
        popUpView.Showpopup { (isfinished) in
            print(isfinished)
        }
        
    }
    
    @IBAction func removePopUp(_ sender: Any) {
        
        popUpView.RemovePopUp { (isfinished) in
            print(isfinished)
        }
    }
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
extension PopupVC: UIPickerViewDelegate , UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            popUpConfig.animationType = .scale
        case 1:
            popUpConfig.animationType = .immediate
        case 2:
            popUpConfig.animationType = .upToDown
        case 3:
            popUpConfig.animationType = .downToUp
        case 4:
            popUpConfig.animationType = .rightToleft
        case 5:
            popUpConfig.animationType = .leftToright
        default:
            break
        }
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let lbl = UILabel()
        lbl.text = animationTypes[row]
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        return lbl
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animationTypes.count
    }
    
}
extension String {
    var CGfloat : CGFloat? {
        let doubleNum = Double(self) ?? nil
        guard let number = doubleNum else {return nil}
        return CGFloat(number)
    }
}

