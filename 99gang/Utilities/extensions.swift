//
//  extensions.swift
//  99gang
//
//  Created by Ahmed Abodeif on 4/21/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}


extension UITextField {
    func applyCustomClearButton() {
        clearButtonMode = .never
        rightViewMode   = .whileEditing
        
        let clearButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        clearButton.setImage(UIImage(named: "multiply")!, for: .normal)
        clearButton.addTarget(self, action: #selector(clearClicked), for: .touchUpInside)
        rightView = clearButton
    }
    
    @objc func clearClicked(sender:UIButton) {
        text = ""
    }
}

