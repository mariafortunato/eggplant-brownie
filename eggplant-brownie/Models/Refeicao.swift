//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Maria Alice Rodrigues Fortunato on 07/02/22.
//

import UIKit

class Refeicao: NSObject {

        //MARK: - Atributos
        var nome: String
        var felicidade: Int
        var itens: Array<Item> = []
        
        // MARK: - Init
        // para inicializar tem que passar essas infos
    init(nome: String, felicidade: Int, itens: [Item] = []) {
            self.nome = nome
            self.felicidade = felicidade
            self.itens = itens
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
