//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Maria Alice Rodrigues Fortunato on 07/02/22.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    

    //MARK: - Atributos
    
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
        
        // MARK: - Init
    
        // para inicializar tem que passar essas infos
    init(nome: String, felicidade: Int, itens: [Item] = []) {
            self.nome = nome
            self.felicidade = felicidade
            self.itens = itens
        }
    // MARK: - NSCoding
    // codificar as infos
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
    }
    // descodificar as infos
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        felicidade = coder.decodeInteger(forKey: "felicidade")
        itens = coder.decodeObject(forKey: "itens") as! Array<Item>
    }
    
    //MARK: - Metodos
    
    func totalCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
            return total
        }
        // detalhes sobre a refeicao
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade)"
            
        for item in itens {
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
            return mensagem
        }
}
