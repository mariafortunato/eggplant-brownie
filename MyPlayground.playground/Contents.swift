import UIKit

// Criar classe que agrupe essas caracteristicas:

class Refeicao {
    //MARK: - Atributos
    var nome: String
    var felicidade: String
    var itens: Array<Item> = []
    
    // MARK: - Construtor
    // para inicializar tem que passar essas infos
    init(nome: String, felicidade: String) {
        self.nome = nome
        self.felicidade = felicidade
    }
    //MARK: - Metodos
    
    func totalCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        return total
    }
}

class Item {
    var nome: String
    var calorias: Double
    
    
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
}


let arroz = Item(nome: "Arroz", calorias: 51.0)
let feijao = Item(nome: "Feijão", calorias: 80.0)
let contraFile = Item(nome: "Contra File", calorias: 287.0)

let refeicao = Refeicao(nome: "Macarrao", felicidade: "5")
refeicao.itens.append(arroz)
refeicao.itens.append(feijao)
refeicao.itens.append(contraFile)

print(refeicao.nome)
if let primeiroItemLista = refeicao.itens.first {
    print(primeiroItemLista.nome)
}

print(refeicao.totalCalorias())
