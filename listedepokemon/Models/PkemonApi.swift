//
//  PkemonApi.swift
//  listedepokemon
//
//  Created by Yacine on 09/10/2019.
//  Copyright © 2019 Kucukoglu Joan. All rights reserved.


import Foundation
import SwiftyJSON
import Alamofire

class pokemonApi{
    
    if let myurl = Bundle.main.path(forResource: "pokemon", ofType: "json")
{
    let url = URL(fileURLWithPath: myurl)
    
    Alamofire.request(url).responseJSON { responds in
        guard let jsonResponse = responds.result.value else {
            return // TODO : error
        }
        let json = JSON(jsonResponse)
        
        let pokemons = json.arrayValue
        print(pokemons)
    }
}
}
