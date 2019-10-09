//
//  Evolution.swift
//  listedepokemon
//
//  Created by Verbeke Yanis on 09/10/2019.
//  Copyright © 2019 Kucukoglu Joan. All rights reserved.
//

import Foundation

class Evolution {
    var level : Int = 0
    var method : String = ""
    var to : String = ""
    var id : String = ""
    
    func setEvolution(lvl : Int, method : String, to : String, id : String) {
        self.level = lvl
        self.method = method
        self.to = to
        self.id = id
    }
}
