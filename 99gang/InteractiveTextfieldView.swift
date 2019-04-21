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
    }
}

