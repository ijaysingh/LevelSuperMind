//
//  CustomTabBar.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 28/02/25.
//

import UIKit

class CustomTabBar: UITabBar {
    
    private let customHeight: CGFloat = 80
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var newSize = super.sizeThatFits(size)
        newSize.height = customHeight
        return newSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let superview = superview else { return }
        
        let safeAreaBottom = safeAreaInsets.bottom
        let newHeight = customHeight + safeAreaBottom
        
        frame = CGRect(x: 0,
                       y: superview.frame.height - newHeight,
                       width: superview.frame.width,
                       height: newHeight)
    }
    
}
