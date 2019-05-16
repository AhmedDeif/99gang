//
//  InteractiveTextfieldView.swift
//  99gang
//
//  Created by Ahmed Abodeif on 4/21/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import UIKit

class InteractiveTextfieldView: UIView {
    
    
    let nibName = "InteractiveTextfieldView"
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var validationLabel: UILabel!
    
    var textfieldType: fieldType?
    var shouldFinishEditingCompletion: (()->())?
    
    
    enum fieldType {
        case email
        case password
        case numeric
        case other
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        contentView.fixInView(self)
        viewSetup()
    }
    
    
    func viewSetup() {
        textfield.applyCustomClearButton()
        textfield.delegate = self
        
        // Params
        if let fieldType = self.textfieldType {
            switch fieldType {
            case .email:
                print("email textfield")
                textfield.keyboardType = .emailAddress
                break
            case .password:
                print("password textfield")
                textfield.isSecureTextEntry = true
                break
            case .numeric:
                textfield.keyboardType = .numberPad
                break
            case .other:
                print("other textfield")
            }
        }
    }
    
    
    func validateField() {
        if let fieldType = self.textfieldType {
            switch fieldType {
            case .email:
                validateEmailField()
                break
            case .password:
                validatePassword()
                break
            case .numeric:
                break
            case .other:
                print("other textfield")
            }
        }
    }
    
    
    func validateEmailField() {
        validationLabel.text = "Incorrect email. Please try again."
    }
    
    func validatePassword() {
        validationLabel.text = "Incorrect Password. Please try again."
    }
    
}



extension InteractiveTextfieldView: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2, animations: {
                self.borderView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            })
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        validateField()
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2, animations: {
                self.borderView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
            })
        }
        self.shouldFinishEditingCompletion?()
        return true
    }
    
}

