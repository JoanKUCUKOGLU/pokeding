//
//  PokemonAPI.swift
//  listedepokemon
//
//  Created by Kucukoglu Joan on 09/10/2019.
//  Copyright © 2019 Kucukoglu Joan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PokemonAPI  {
    
    
    var jsonParse = JsonParse()
    
    func getPokemon(completion: @escaping(([Pokemon])->Void)){
        if let myurl = Bundle.main.path(forResource: "pokemon", ofType: "json") {
            
            let url = URL(fileURLWithPath: myurl)
            Alamofire.request(url).responseJSON { response in
                if let jsonResponse = response.result.value {
                    
                    let json = JSON(jsonResponse)
                    let poke = json.arrayValue.map {
                        
                        self.jsonParse.parsePkm(json: $0)
                        
                    }
                    
                    completion(poke)
                }
            }
        }
    }
}
