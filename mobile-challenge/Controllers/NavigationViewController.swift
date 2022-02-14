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
        
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .black
        navigationBar.tintColor = .white
        navigationBar.backgroundColor = .black
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
}
