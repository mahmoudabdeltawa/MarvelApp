//
//  ScreenMultiplier.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

//MARK: - Design will be consistent across different sizes, including iPhone SE. Let's start designing on the iPhone

func MultiplierWidth(_ ControlW:CGFloat) -> CGFloat {
let width = 375.0
let widthRat:CGFloat = UIScreen.main.bounds.width / CGFloat(width)
let W = ControlW * widthRat
return W
}


func MultiplierHeight(_ ControlH:CGFloat) -> CGFloat {
let height = 667.0
let heightRat:CGFloat = UIScreen.main.bounds.height / CGFloat(height)
let H = ControlH * heightRat
return H
}
