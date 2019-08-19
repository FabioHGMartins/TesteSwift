//
//  CarroService.swift
//  TesteSwift
//
//  Created by Fabio Martins on 14/08/18.
//  Copyright © 2018 Fabio Martins. All rights reserved.
//

import Foundation
class CarroService {
    
    //Busca os carros pelo tipo (esportivos, classicos ou luxo) como no nome do arquivo XML
    class func getCarrosByTipoFromFile(_ tipo: String) -> Array<Carro> {
        let file = "carros_" + tipo
        let path = Bundle.main.path(forResource: file, ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!))
        let carros = parserJson(data!)
        return carros
    }
    
    //Parser de XML com SAX
//    class func parserXML_SAX(_ data: Data) -> Array<Carro> {
//        if (data.count == 0) {
//            return []
//        }
//
//        var carros : Array<Carro> = []
//        let xmlParser = XMLParser(data: data)
//        let carrosParser = XMLCarroParser()
//        xmlParser.delegate = carrosParser
//        // Inicia o parser com o XMLParser que vai chamar o XMLCarroParser
//        let ok = xmlParser.parse()
//        if(ok) {
//            carros = carrosParser.carros
//            let count = carros.count
//            print("Parser, encontrado \(count) carros")
//        } else {
//            print("Erro no parser")
//        }
//        return carros
//    }
    
    class func parserJson(_ data: Data) -> Array<Carro> {
        var carros: Array<Carro> = []
        // le o arquivo Json e insere num dicionario
        
        do{
            let arrayCarros = try JSONSerialization.jsonObject(with: data,
                                                               options: JSONSerialization.ReadingOptions.mutableContainers)
            for obj in arrayCarros {
                let dict = obj as! NSDictionary
                let carro = Carro()
                carro.nome = dict["nome"] as! String
                carro.desc = dict["desc"] as! String
                carro.url_info = dict["url_info"] as! String
                carro.url_foto = dict["url_foto"] as! String
                carro.url_video = dict["url_video"] as! String
                carro.latitude = dict["latitude"] as! String
                carro.longitude = dict["longitude"] as! String
                carros.append(carro)
            }
        } catch let error as NSError {
            print("Erro ao ler JSON \(error)")
        }
        return carros
    }
    
}
