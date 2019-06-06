//
//  ViewController.swift
//  PinCodeTextField
//
//  Created by Alexander Tkachenko on 3/15/17.
//  Copyright © 2017 organization. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pinCodeTextField: PinCodeTextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.pinCodeTextField.becomeFirstResponder()
        }
        
        pinCodeTextField.delegate = self
        pinCodeTextField.keyboardType = .phonePad
        pinCodeTextField.isSecureTextEntry = true
        
        let toolbar = UIToolbar()
        let nextButtonItem = UIBarButtonItem(title: NSLocalizedString("DONE",
                                                                      comment: ""),
                                             style: .done,
                                             target: self,
                                             action: #selector(pinCodeNextAction))
        toolbar.items = [nextButtonItem]
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        pinCodeTextField.inputAccessoryView = toolbar
    }

    override public var prefersStatusBarHidden: Bool {
        return false
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @objc private func pinCodeNextAction() {
        view.endEditing(true)
    }
    
    @IBAction func didTapSecureUnSecureBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        pinCodeTextField.isSecureTextEntry = !pinCodeTextField.isSecureTextEntry
        pinCodeTextField.updateView()
    }
}


extension ViewController: PinCodeTextFieldDelegate, UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: PinCodeTextField) -> Bool {
        return true
    }
    
    func textFieldValueChanged(_ textField: PinCodeTextField) {
        
        let value = textField.text ?? ""
        print(value)
    }
    
    func textFieldShouldEndEditing(_ textField: PinCodeTextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: PinCodeTextField) -> Bool {
        return true
    }
    
}
