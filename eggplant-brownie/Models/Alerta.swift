//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Maria Alice Rodrigues Fortunato on 10/02/22.
//

import UIKit

class Alerta {
    let controller: UIViewController // constante do tipo UIViewController
    
    init(controller: UIViewController) { // iniciando ela
        self.controller = controller
    }
    
    func exibe(titulo: String = "Atenção", mensagem: String) {
        let alerta = UIAlertController(title: titulo , message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
        
    }
}
