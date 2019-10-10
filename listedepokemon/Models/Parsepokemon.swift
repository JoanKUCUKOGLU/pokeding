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
        let evolution = Evolution()
        evolution.setEvolution(lvl: json["level"].intValue, method: json["method"].stringValue, to: json["to"].stringValue, id: json["_id"].stringValue)
    
        pokemon.setPkmn(id: json["_id"].stringValue, pkmnId: json["pkdx_id"].intValue, name :  json["name"].stringValue, imgUrl: json["image_url"].stringValue, desc: json["description"].stringValue, types: [json["types"].stringValue], evol: evolution)
        
        return pokemon
    }
}
