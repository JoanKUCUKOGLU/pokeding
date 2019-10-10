//
//  PokemonTableViewCellViewModel.swift
//  listedepokemon
//
//  Created by Kucukoglu Joan on 09/10/2019.
//  Copyright © 2019 Kucukoglu Joan. All rights reserved.
//

import Foundation

struct PokemonTableViewCellViewModel {
    let cellIndex : Int
    let pokemonName : String
    let pokemonId : String
    let pokemonImageURL : String
    
    init(cellIndex : Int, pokemonName : String, pokemonId : Int, pokemonImageURL : String) {
        self.cellIndex = cellIndex
        self.pokemonName = pokemonName
        self.pokemonId = "#\(pokemonId)"
        self.pokemonImageURL = pokemonImageURL
    }
}
