//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Maria Alice Rodrigues Fortunato on 08/02/22.
//
import UIKit
                                    // metodos obrigatorios da tableview -- protocolo
class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes: [Refeicao] = []
    
    override func viewDidLoad() {
        
        refeicoes = RefeicaoDao().recupera()
        
    }
    func recuperaCaminho() -> URL? {
        // implementaçao para salvar o arquivo
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        // caminho para salvar a lista na pasta refeicao
        let caminho = diretorio.appendingPathComponent("refeicao")
        
        return caminho
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
                                                     // qual arquivo abrir: é o proprio arquivo
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
            // _ ocultando o primeiro parametro para nao ficar repetitivo
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
        
        RefeicaoDao().save(refeicoes)
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        // verificar o estado que esta (began: se pressionou). Se nao houver a verificacao vai chamar ao clicar e ai soltar
        if gesture.state == .began {
            // recupera celula que foi tocada
            let celula = gesture.view as! UITableViewCell
            // se for diferente de nil
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            // pega o objeto da linha
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(controller: self).exibe(refeicao, handler: { alerta in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
        }
    }
    
    // navegar entre as telas
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
                
            }
        }
    }
}
