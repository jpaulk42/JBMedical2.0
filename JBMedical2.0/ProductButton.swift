//
//  ProductButton.swift
//  JBMedical2.0
//
//  Created by James Paulk on 4/28/17.
//  Copyright © 2017 James Paulk. All rights reserved.
//

import UIKit

class ProductButton: UIButton
{
    var isNeeded: Bool = false
    private let filled = UIImage(named: "filled")
    private let unfilled = UIImage(named: "unfilled")
    
    public func select()
    {
        if !isNeeded
        {
            isNeeded = true
            self.setImage(filled, for: .normal)
        }
        else
        {
            isNeeded = false
            self.setImage(unfilled, for: .normal)
        }
    }
}
