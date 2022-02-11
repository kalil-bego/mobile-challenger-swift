//
//  LoadingView.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 10/02/22.
//

import UIKit

final class LoadingView: UIView {
    
    private lazy var dotOne: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let dotTwo: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let dotTree: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 5
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(dotOne)
        NSLayoutConstraint.activate([
            dotOne.heightAnchor.constraint(equalToConstant: 10),
            dotOne.widthAnchor.constraint(equalToConstant: 10),
            dotOne.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            dotOne.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        addSubview(dotTwo)
        NSLayoutConstraint.activate([
            dotTwo.heightAnchor.constraint(equalToConstant: 10),
            dotTwo.widthAnchor.constraint(equalToConstant: 10),
            dotTwo.centerXAnchor.constraint(equalTo: centerXAnchor),
            dotTwo.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        addSubview(dotTree)
        NSLayoutConstraint.activate([
            dotTree.heightAnchor.constraint(equalToConstant: 10),
            dotTree.widthAnchor.constraint(equalToConstant: 10),
            dotTree.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            dotTree.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        self.animationDots()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animationDots() {
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.dotOne.center.y = 10
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.2, options: [.repeat, .autoreverse], animations: {
            self.dotTwo.center.y = 10
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.4, options: [.repeat, .autoreverse], animations: {
            self.dotTree.center.y = 10
        }, completion: nil)
    }

}
