//
//  RefeicaoDao.swift
//  eggplant-brownie
//
//  Created by Maria Alice Rodrigues Fortunato on 15/02/22.
//DAO - acessar os dados

import UIKit

class RefeicaoDao {
    func save(_ refeicoes: [Refeicao]){
        guard let caminho = recuperaCaminho() else { return }
        
        // do - faça
        do { // tentar converter com try/
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {// vizualizar o erro
            print(error.localizedDescription)
        }
        
    }
    func recuperaCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("refeicao")
        return caminho
    }
    
    func recupera() -> [Refeicao] {
        guard let caminho = recuperaCaminho() else { return [] }
        do {
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else { return [] }
            
            return refeicoesSalvas
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
