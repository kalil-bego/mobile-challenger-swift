//
//  LoadingViewController.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 14/02/22.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let loadingView = LoadingView(frame: view.frame)
        view.insertSubview(loadingView, at: 0)
        loadingView.center = view.center
    }

}
