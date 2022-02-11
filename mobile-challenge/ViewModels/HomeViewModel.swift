//
//  HomeViewModel.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 08/02/22.
//

import Foundation
import UIKit

final class HomeViewModel {
    
    let title = "GitHub JavaPop"
    
    // COMENTARIO: geralmente o Model da ViewModel é privado, a ViewModel contém a Model e trata os dados pra ViewController. Exemplo: A ViewController precisa do nome do repositorio que está na posição 4, então cria-se uma função getRepositoryByPosition(position: Int) e retorna apenas o nome, tratado ou não, para a ViewController. Isso é pra deixar a responsabilidade do tratamento do dado (Model) com a ViewModel e também ajuda MUITO na testabilidade do seu codigo.
    var repositories: [RepositoryInfo]?
    
    func getRepositories(completion: @escaping([RepositoryInfo]?) -> Void) {
        RepositoriesManager.shared.getRepositories { repositories, _ in
            self.repositories = repositories
            
            if let repositories = repositories {
                if repositories.count > 0 {
                    completion(repositories)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
    
}
