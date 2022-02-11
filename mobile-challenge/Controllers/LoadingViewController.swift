//
//  LoadingViewController.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 08/02/22.
//

import UIKit

final class LoadingViewController: UIViewController {
    
    private lazy var loading: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        return loading
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            // Fallback on earlier versions
        }
        view.addSubview(loading)
        loading.center = view.center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loading.startAnimating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        loading.stopAnimating()
    }

}
