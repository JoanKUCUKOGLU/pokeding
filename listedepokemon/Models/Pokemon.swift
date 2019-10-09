//
//  Pokemon.swift
//  listedepokemon
//
//  Created by Verbeke Yanis on 08/10/2019.
//  Copyright © 2019 Kucukoglu Joan. All rights reserved.
//

import UIKit

class Pokemon {
    var id : String = ""
    var pkmnId : Int = 0
    var name : String = ""
    var imgUrl : String = ""
    var img : UIImage?
    var description : String = ""
    var types : [String] = [""]
    var evolutions : Evolution = Evolution()
    
    func setPkmn(id : String, pkmnId : Int, name : String, imgUrl : String, desc : String, types : [String], evol : Evolution) {
        self.id = id
        self.pkmnId = pkmnId
        self.name = name
        self.imgUrl = imgUrl
        self.load(url: URL.init(string: imgUrl)!)
        self.description = desc
        self.types = types
        self.evolutions = evol
    }
}

extension Pokemon {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.img = image
                    }
                }
            }
        }
    }
}

