//
//  ViewController.swift
//  tabelaRefeicoesDinamica
//
//  Created by Maria Alice Rodrigues Fortunato on 08/02/22.
//

import UIKit

class ViewController: UITableViewController {
    
    let refeicoes = ["Churros", "Macarrão", "Pizza"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController deu certo")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    } // numero de linhas
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        
        celula.textLabel?.text = refeicao
        
        return celula
    } // conteudo da celula

}

