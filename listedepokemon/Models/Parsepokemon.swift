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
    func  parsePkm(json: JSON) -> [Pokemon] {
        var pkm : [Pokemon] = []
        for i in 0...json.count-1 {
            let pokemon = Pokemon()
            let evolution = Evolution()
            evolution.setEvolution(lvl: json[i]["level"].intValue, method: json[i]["method"].stringValue, to: json[i]["to"].stringValue, id: json[i]["_id"].stringValue)
            pokemon.setPkmn(id: json[i]["_id"].stringValue, pkmnId: json[i]["pkdx_id"].intValue, name :  json[i]["name"].stringValue, imgUrl: json[i]["image_url"].stringValue, desc: json[i]["description"].stringValue, types: [json[i]["types"].stringValue], evol: evolution)
            
        
            pkm.append(pokemon)
        }
        return pkm
    }
}
