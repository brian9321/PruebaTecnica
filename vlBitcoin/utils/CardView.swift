//
//  CardView.swift
//  vlBitcoin
//
//  Created by Brian Aboytes Morales on 06/09/21.
//

import Foundation
import UIKit

@IBDesignable class CardView : UIView {
    @IBInspectable var cornnerRadius: CGFloat = 5.0
    var ofsetWidth: CGFloat = 5
    var ofsetHeigth: CGFloat = 5
    
    @IBInspectable var ofsetShadownOpacity: Float = 5
    @IBInspectable var color  = UIColor.systemGray4
    
    override func layoutSubviews() {
        layer.cornerRadius = self.cornnerRadius
        layer.shadowColor = self.color.cgColor
        layer.shadowOffset = CGSize(width: self.ofsetWidth, height: self.ofsetHeigth)
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornnerRadius).cgPath
        layer.shadowOpacity = self.ofsetShadownOpacity
    }
}


