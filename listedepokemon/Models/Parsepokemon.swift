//
//  Parsepokemon.swift
//  listedepokemon
//
//  Created by Yacine on 09/10/2019.
//  Copyright © 2019 Kucukoglu Joan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class JsonParse{
    func  parsePkm(json: JSON) -> Pokemon {
        
        let pokemon = Pokemon()
        
        pokemon.setPkmn(id: json["_id"].stringValue, pkmnId: json["pkdx_id"].intValue, name :  json["name"].stringValue, imgUrl: json["image_url"].stringValue, desc: json["description"].stringValue, types: bindToType(jsonArray: json["types"].arrayValue), evol: bindToEvolutions(jsonArray: json["evolutions"].arrayValue))
        
        return pokemon
    }
    
    func bindToType(jsonArray: [JSON]) -> [Type] {
        let types = jsonArray.compactMap { Type(rawValue: $0.stringValue) }
        return types
    }
    
    func bindToEvolutions(jsonArray: [JSON]) -> [Evolution] {
        let evolutions = jsonArray.compactMap { json in
            
            Evolution(pokemonId: json["_id"].stringValue,
                      method: EvolutionMethod(method: json["_id"].stringValue,
                                              level: json["level"].int),
                      name: json["to"].stringValue)
        }
        
        return evolutions
    }
}
