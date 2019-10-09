//
//  ViewController.swift
//  listedepokemon
//
//  Created by Kucukoglu Joan on 07/10/2019.
//  Copyright © 2019 Kucukoglu Joan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var pokemonList: UITableView!
    
    var pokemonArray : [Pokemon] = []
    var pokemonAPI = PokemonAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonAPI.getPokemon { pokemonArray in
            self.reloadPokedex(with: pokemonArray)
        }
    }
    
    func reloadPokedex(with pkmnList:[Pokemon]) {
        self.pokemonArray = pkmnList
        pokemonList.reloadData()
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cellPokemon"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? PokemonTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let currentPokemon = pokemonArray[indexPath.row]
        print(currentPokemon.name)
        
        cell.pkmnImage.image = currentPokemon.img
        cell.pkmnName.text = currentPokemon.name
        cell.pkmnId.text = "\(currentPokemon.pkmnId)    "
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    /*
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     <#code#>
     }
     */
}
