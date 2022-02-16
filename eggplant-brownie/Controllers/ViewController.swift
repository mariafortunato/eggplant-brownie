//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Maria Alice Rodrigues Fortunato on 03/02/22.
//

import UIKit
// equivalente a interface
// fazendo a ponte entre as telas, para que uma use apenas o essencial da outra
protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao) // apenas esse metodo da outra tela
}
                    // metodos
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionarItensDelegate{
    
    // MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() { // acabou de ser carregada
        let botaoAdicionarItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionarItem
        recuperaItens()
    }
    func recuperaItens() {
        itens = ItemDao().recupera()
    }
    
    @objc func adicionarItem() {
        // chamar a proxima tela
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    func add(_ item: Item) {
        itens.append(item)
        ItemDao().save(itens)
        // verificando e atualizando a tela
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            Alerta(controller: self).exibe(mensagem: "Erro ao atualizar tabela")
        }
        
    }
    
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linhaTabela = indexPath.row
        let item = itens[linhaTabela]
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else{ return }
        
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            
            let linhaTabela = indexPath.row
            itensSelecionados.append(itens[linhaTabela])
        } else {
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            
            if let position = itensSelecionados.index(of: item){
                itensSelecionados.remove(at: position)
            }
        }
        
    }
    func recuperaRefeicaoFormulario() -> Refeicao? {
        guard let nomeRefeicao = nomeTextField?.text else{
           
            return nil
        }
        guard let felicidadeRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeRefeicao) else {
           
            return nil
        }
        let refeicao = Refeicao(nome: nomeRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        return refeicao
    }
    
    // MARK: - IBAction
    
    @IBAction func adicionar(_ sender: Any) {
        
        if let refeicao = recuperaRefeicaoFormulario() {
            delegate?.add(refeicao)
            navigationController?.popViewController(animated: true)
        } else {
            Alerta(controller: self).exibe(mensagem: "Erro ao ler dados do formulário")
        }
    }
}
