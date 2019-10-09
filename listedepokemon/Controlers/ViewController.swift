//
//  ViewController.swift
//  listedepokemon
//
//  Created by Kucukoglu Joan on 07/10/2019.
//  Copyright © 2019 Kucukoglu Joan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tvListPokemon: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var pkmns : [Pokemon] = []
        let Bulbasaur = Pokemon()
        let evol = Evolution()
        evol.setEvolution(lvl: 16, method: "level_up", to: "Ivysaur", id: "557a723880a20c9db3bc31c3")
        Bulbasaur.setPkmn(id: "557a723880a20c9db3bc31c2", pkmnId: 1, imgUrl: "http://assets22.pokemon.com/assets/cms2/img/pokedex/full/001.png", desc: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger.  Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger.", types: ["grass", "poison"], evol: evol)
        pkmns.append(Bulbasaur)
    }
}
