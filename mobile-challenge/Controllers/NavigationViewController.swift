//
//  NavigationViewController.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 02/02/22.
//

import UIKit

// COMENTARIO: O nome dessa classe não quer dizer muuita coisa, olhando assim eu nem sei qual o proposito dela.
final class NavigationViewController: UINavigationController {
    // COMENTARIO: não é taaao importante assim, mas tenta nao usar tanta linha em branco, visualmente vai ficando feio e tbm ajuda, bem pouco mas ajuda, no tamanho dos arquivos. Dica: usar swift lint
    override func viewDidLoad() {
        super.viewDidLoad()
        // COMENTARIO: usar self de forma desnecessaria causa a impressao de que estou olhando pra uma thread secundaria, que é onde é obrigatoria.
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = .black
        self.navigationBar.tintColor = .white
        self.navigationBar.backgroundColor = .black
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        // COMENTARIO: Puramente estetica, mas tenta usar o implicit return (quando uma funcao/variavel retorna alguma coisa e ela só tem uma linha, não precisa da palavrar return)
        return .lightContent
    }
    
}
