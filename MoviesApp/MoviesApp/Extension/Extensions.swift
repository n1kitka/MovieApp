//
//  Extensions.swift
//  MoviesApp
//
//  Created by Никита Савенко on 23.12.2023.
//

import Foundation
import UIKit

extension UIButton {
    func buttonBorderColor(borderColor : UIColor? = .black, cornerRadius : CGFloat? = 15.0){
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = cornerRadius ?? 0.0
    }
}
