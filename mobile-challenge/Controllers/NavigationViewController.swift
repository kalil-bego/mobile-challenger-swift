//
//  NavigationViewController.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 02/02/22.
//

import UIKit

final class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = .black
        self.navigationBar.tintColor = .white
        self.navigationBar.backgroundColor = .black
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
