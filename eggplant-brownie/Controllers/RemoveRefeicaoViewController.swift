//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Maria Alice Rodrigues Fortunato on 10/02/22.
//

import UIKit

class RemoveRefeicaoViewController : UIViewController {
    
    let controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    // clousure - funcoes dentro de parametros
    
                                        // somente quando o usuario fizer uma ação 
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction)-> Void) {
        // criar um alerta
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        // botoes para o alerta                                        o que fazer quando for pressionado o botao
        let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(botaoCancelar)
                                                                            
        let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: handler)
        
        alerta.addAction(botaoRemover)
        
        // acesso ao metodo present
        controller.present(alerta, animated: true, completion: nil)
    }
}
