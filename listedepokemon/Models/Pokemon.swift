//
//  Pokemon.swift
//  listedepokemon
//
//  Created by Verbeke Yanis on 08/10/2019.
//  Copyright © 2019 Kucukoglu Joan. All rights reserved.
//

import Foundation

class Pokemon {
    var id : String = ""
    var pkmnId : Int = 0
    var imgUrl : String = ""
    var description : String = ""
    var types : [String] = [""]
    var evolutions : Evolution = Evolution()
    
    func setPkmn(id : String, pkmnId : Int, imgUrl : String, desc : String, types : [String], evol : Evolution) {
        self.id = id
        self.pkmnId = pkmnId
        self.imgUrl = imgUrl
        self.description = desc
        self.types = types
        self.evolutions = evol
    }
}
