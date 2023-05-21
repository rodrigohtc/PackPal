//
//  AppSettings.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import UIKit

public class PacPalView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setBackground()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _setBackground()
    }
    
    public func _setBackground() {
        backgroundColor = .orange
    }
    
}
