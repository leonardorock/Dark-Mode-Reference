//
//  SystemColor.swift
//  SystemColors
//
//  Created by Leonardo Oliveira on 23/07/19.
//  Copyright © 2019 Leonardo Oliveira. All rights reserved.
//

import UIKit

struct SystemColor {
    
    let name: String
    let color: UIColor
    
    var rgba: String? {
        var red:    CGFloat = 0.0
        var green:  CGFloat = 0.0
        var blue:   CGFloat = 0.0
        var alpha:  CGFloat = 0.0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return String(format: "R: %03.0f G: %03.0f B: %03.0f A: %02.0f", red * 255, green * 255, blue * 255, alpha * 100)
    }
    
}
