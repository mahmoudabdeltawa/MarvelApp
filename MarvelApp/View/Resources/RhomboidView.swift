//
//  RhomboidView.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

//MARK: - Rhomboid View  <<  There was an error in the sent image. I created the required shapes using code.

class RhomboidView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let startPoint = CGPoint(x: rect.maxX  , y: rect.minY)
        let bottomLeftPoint = CGPoint(x: rect.minX + 20, y: rect.minY)
        let bottomRightPoint = CGPoint(x: rect.maxX - 20, y: rect.maxY)
        let endPoint = CGPoint(x: rect.minX, y: rect.maxY)
        
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: bottomLeftPoint)
        path.addLine(to: endPoint)
        path.addLine(to: bottomRightPoint)
        path.close()
        
        UIColor.white.setFill()
        path.stroke()
        path.fill()
    
    }
}
