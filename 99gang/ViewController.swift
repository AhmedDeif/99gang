//
//  ViewController.swift
//  99gang
//
//  Created by Ahmed Abodeif on 4/18/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextfieldLowerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.applyCustomClearButton()
        emailTextField.tag = 0
        emailTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
 
    }

}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.2, animations: {
                    self.emailTextfieldLowerView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                })
                print("bright background Color")
            }
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            DispatchQueue.main.async {
                self.emailTextfieldLowerView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
                print("shaded background Color")
            }
        }
        return true
    }
}



extension UITextField {
    func applyCustomClearButton() {
        clearButtonMode = .never
        rightViewMode   = .whileEditing
        
        let clearButton = UIButton(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        clearButton.setImage(UIImage(named: "multiply")!, for: .normal)
        clearButton.addTarget(self, action: #selector(clearClicked), for: .touchUpInside)
        rightView = clearButton
    }
    
    @objc func clearClicked(sender:UIButton) {
        text = ""
    }
}

