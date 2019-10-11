//
//  Evolution.swift
//  listedepokemon
//
//  Created by Verbeke Yanis on 09/10/2019.
//  Copyright © 2019 Kucukoglu Joan. All rights reserved.
//

import Foundation
import UIKit

enum EvolutionMethod {
    case stone
    case trade
    case other
    case levelUp(level: Int)
    
    func getIcon() -> UIImage? {
        switch self {
        case .stone:
            return UIImage(named: "stone")
        case .trade:
            return UIImage(named: "trade")
        default:
            return nil
        }
    }
    
    func getText() -> String? {
        switch self {
        case .levelUp(let level):
            return "lvl (level)"
        case .other:
            return "?"
        default:
            return nil
        }
    }
    
    init(method: String, level: Int? = nil) {
        if let level = level {
            self = .levelUp(level: level)
        } else if method == "stone" {
            self = .stone
        } else if method == "trade" {
            self = .trade
        } else {
            self = .other
        }
    }
}

class Evolution {
    var pokemonId: String
    var method: EvolutionMethod
    var name: String
    
    init(pokemonId: String,
         method: EvolutionMethod,
         name: String) {
        self.pokemonId = pokemonId
        self.method = method
        self.name = name
    }
}
