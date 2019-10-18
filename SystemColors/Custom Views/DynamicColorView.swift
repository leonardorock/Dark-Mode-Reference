//
//  DynamicColorView.swift
//  SystemColors
//
//  Created by Leonardo Oliveira on 17/10/19.
//  Copyright © 2019 Leonardo Oliveira. All rights reserved.
//

import UIKit

@IBDesignable
final class DynamicColorView: BorderView {

    @IBInspectable var lightAppearanceBackgroundColor: UIColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) {
        didSet {
            updateBackgroundColor()
        }
    }

    @IBInspectable var darkAppearanceBackgroundColor: UIColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1) {
        didSet {
            updateBackgroundColor()
        }
    }
    
    override func setup() {
        super.setup()
        updateBackgroundColor()
    }
    
    func updateBackgroundColor() {
        backgroundColor = UIColor(dynamicProvider: { traitCollection -> UIColor in
            if traitCollection.containsTraits(in: UITraitCollection(userInterfaceStyle: .dark)) {
                return self.darkAppearanceBackgroundColor
            }
            return self.lightAppearanceBackgroundColor
        })
    }
    
    
    override func prepareForInterfaceBuilder() {
        updateBackgroundColor()
    }
    
}
