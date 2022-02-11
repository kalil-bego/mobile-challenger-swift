//
//  ErrorView.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 11/02/22.
//

import UIKit

final class ErrorView: UIView {
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25, weight: .bold)
        // COMENTARIO: no safra a gente nao implementa (eu até comecei a fazer mas vi que prro safra nao fazia sentido) mas tenta ver sobre Localizable Strings. É uma forma de guardar todas as Strings que são apresentadas pro usuario num arquivo só, e caso necessário fazer a traduçã delas pra qualquer outro idioma, assim vc teria um app universal!
        label.text = "Ops... Ocorreu um erro, tente novamente mais tarde"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.tintColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(errorLabel)
        NSLayoutConstraint.activate([
            errorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            errorLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            errorLabel.heightAnchor.constraint(equalToConstant: 60),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
