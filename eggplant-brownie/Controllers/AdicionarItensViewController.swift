//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Maria Alice Rodrigues Fortunato on 09/02/22.
//

import UIKit

protocol AdicionarItensDelegate {
    func add(_ item: Item)
}
class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - Atributos
    
    var delegate: AdicionarItensDelegate?
    
    init(delegate: AdicionarItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        // navegar para proxima tela: navigationController.push()
        // voltar para tela anterior: navigationController.pop()
         
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else { return }
        
        if let numeroCalorias = Double(calorias){
            let item = Item(nome: nome, calorias: numeroCalorias)
            
            
            delegate?.add(item)

            // delegate?.add(item) : se existir add. Se nao existe, nao faz nada, mas nao da crash
            navigationController?.popViewController(animated: true)
        }

    }
    
}
