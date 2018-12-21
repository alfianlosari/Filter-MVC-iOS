//
//  UIViewController+Extensions.swift
//  FilterMVC
//
//  Created by Alfian Losari on 12/21/18.
//  Copyright © 2018 Alfian Losari. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addChild(childController: UIViewController, to view: UIView) {
        self.addChild(childController)
        childController.view.frame = view.bounds
        view.addSubview(childController.view)
        childController.didMove(toParent: self)
    }
    
}
