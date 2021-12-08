//
//  NavigationViewExtension.swift
//  DatingApp
//
//  Created by Arman Abkar on 7/25/21.
//

import SwiftUI

extension NavigationView {
    static func popToRootView() {
        findNavigationController(viewController: UIApplication
                                    .shared
                                    .connectedScenes
                                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                                    .first { $0.isKeyWindow }?
                                    .rootViewController)?
                                    .popToRootViewController(animated: true)
    }
    
    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
        
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
        
        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        
        return nil
    }
}
