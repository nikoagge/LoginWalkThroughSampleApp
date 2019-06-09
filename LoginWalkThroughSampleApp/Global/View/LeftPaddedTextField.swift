//
//  LeftPaddedTextField.swift
//  LoginWalkThroughSampleApp
//
//  Created by Nikolas on 09/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import UIKit


class LeftPaddedTextField: UITextField {

    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
}
