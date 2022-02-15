//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by Maria Alice Rodrigues Fortunato on 15/02/22.
//

import Foundation

class ItemDao {
    func save(_ itens: [Item]) {
        // do - faça
        do { // tentar converter com try/
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let caminho = recuperaCaminho() else { return }
            try dados.write(to: caminho)
        } catch {// vizualizar o erro
            print(error.localizedDescription)
        }
    }
    func recupera() -> [Item] {
        do {
            guard let diretorio = recuperaCaminho() else { return [] }
            let dados = try Data(contentsOf: diretorio)
            
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! [Item]
            return itensSalvos
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    func recuperaCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        let caminho = diretorio.appendingPathComponent("itens")
        return caminho
    }
}
