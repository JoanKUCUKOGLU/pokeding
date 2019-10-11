//
//  Type.swift
//  listedepokemon
//
//  Created by Kucukoglu Joan on 11/10/2019.
//  Copyright © 2019 Kucukoglu Joan. All rights reserved.
//

import Foundation
import UIKit

enum Type: String {
    case bug
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case water
    
    func getIcon() -> UIImage? {
        switch self {
        case .bug:
            return UIImage(named: "bug")
        case .dragon:
            return UIImage(named: "dragon")
        case .electric:
            return UIImage(named: "electric")
        case .fairy:
            return UIImage(named: "fairy")
        case .fighting:
            return UIImage(named: "fighting")
        case .fire:
            return UIImage(named: "fire")
        case .flying:
            return UIImage(named: "flying")
        case .ghost:
            return UIImage(named: "ghost")
        case .grass:
            return UIImage(named: "grass")
        case .ground:
            return UIImage(named: "ground")
        case .ice:
            return UIImage(named: "ice")
        case .normal:
            return UIImage(named: "normal")
        case .poison:
            return UIImage(named: "poison")
        case .psychic:
            return UIImage(named: "psychic")
        case .rock:
            return UIImage(named: "rock")
        case .steel:
            return UIImage(named: "steel")
        case .water:
            return UIImage(named: "water")
        }
    }
}
