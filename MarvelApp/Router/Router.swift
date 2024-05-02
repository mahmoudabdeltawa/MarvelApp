//
//  Router.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit


func Dismiss(FromController:UIViewController) {
    FromController.dismiss(animated: true)
}

func Present(FromController: UIViewController,ToViewController: UIViewController ,modalPresentation : UIModalPresentationStyle = .overFullScreen ,modalTransition : UIModalTransitionStyle = .crossDissolve ) {
 ToViewController.modalPresentationStyle = modalPresentation
 ToViewController.modalTransitionStyle = modalTransition
 FromController.present(ToViewController, animated: true)
}

