//
//  HideNavigationBarBehavior.swift
//  AutoLayoutExercises
//
//  Created by Dominik Olędzki on 19/11/2017.
//

import UIKit

class HideNavigationBarBehavior: NSObject, UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let goesToRoot = viewController == navigationController.viewControllers.first
        navigationController.setNavigationBarHidden(goesToRoot, animated: animated)
    }
}
