//
//  XMLCarroParser.swift
//  TesteSwift
//
//  Created by Fabio Martins on 17/08/18.
//  Copyright © 2018 Fabio Martins. All rights reserved.
//

import Foundation
extension String{
    
    func trim() -> String {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        return trimmedString
    }
    
    func replace(_ of: String, with: String) -> String {
        let s = self.replacingOccurrences(of: "\n", with: "")
        return s
    }
    
    func url() -> URL {
        return URL(string:self)!
    }
    
}

class XMLCarroParser : NSObject, XMLParserDelegate {
    
    var carros : Array <Carro> = []
    var tempString: String = ""
    var carro: Carro?
    
    
    func parser(_ parser : XMLParser, didStartElement elementName: String, namespaceURI: String?,
                qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if("carro" == elementName) {
            // Tag <carro> encontrada, cria um carro
            carro = Carro()
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if(elementName == "carros") {
            // Tag </carros>, indicando fim do arquivo
            return
        }
        
        if("carro" == elementName) {
            // Tag </carro>, indicando fim do objeto
            self.carros.append(carro!)
            carro = nil // Limpa a variável para usá-la novamente
            return
        }
        
        if(carro != nil) {
            if(elementName == "nome") {
                carro!.nome = tempString
            } else if(elementName == "desc") {
                carro!.desc = tempString
            } else if(elementName == "url_foto") {
                carro!.url_foto = tempString
            } else if(elementName == "url_info") {
                carro!.url_info = tempString
            } else if(elementName == "url_video") {
                carro!.url_video = tempString
            } else if(elementName == "latitude") {
                carro!.latitude = tempString
            } else if(elementName == "longitude") {
                carro!.longitude = tempString
            }
            tempString = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        var s = string.replace("/n", with: "")
        s = s.replace("\t", with:"")
        s = s.trim()
        tempString += s
    }
    
}
