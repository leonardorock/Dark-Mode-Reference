//
//  BorderView.swift
//  SystemColors
//
//  Created by Leonardo Oliveira on 17/10/19.
//  Copyright © 2019 Leonardo Oliveira. All rights reserved.
//

import UIKit

@IBDesignable
class BorderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.separator.cgColor
        layer.cornerRadius = 4
        layer.masksToBounds = true
    }
    
}
