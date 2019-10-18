//
//  ElevationView.swift
//  SystemColors
//
//  Created by Leonardo Oliveira on 17/10/19.
//  Copyright © 2019 Leonardo Oliveira. All rights reserved.
//

import UIKit

@IBDesignable
final class ElevationView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .tertiarySystemBackground
        layer.masksToBounds = false
        layer.cornerRadius = 4
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.12
        layer.shadowRadius = 8.0
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateShadowPath(for: bounds)
    }
    
    func updateShadowPath(for rect: CGRect) {
        layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: layer.cornerRadius).cgPath
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) && traitCollection.containsTraits(in: UITraitCollection(userInterfaceStyle: .dark)) {
            layer.shadowOpacity = 0
        } else {
            layer.shadowOpacity = 0.12
        }
    }
    
    override func prepareForInterfaceBuilder() {
        backgroundColor = .tertiarySystemBackground
    }
    
}
