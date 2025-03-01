//
//  DashedLineView.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 01/03/25.
//

import UIKit

class DashedLineView: UIView {
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let dashPattern: [CGFloat] = [4, 4]
        context.setLineDash(phase: 0, lengths: dashPattern)
        context.setStrokeColor(UIColor.lightGray.cgColor)
        context.setLineWidth(1.0)

        let numberOfLines = 4
        let spacing = rect.height / CGFloat(numberOfLines + 1)

        for i in 1...numberOfLines {
            let y = spacing * CGFloat(i)
            context.move(to: CGPoint(x: 0, y: y))
            context.addLine(to: CGPoint(x: rect.width, y: y))
            context.strokePath()
        }
    }
}
