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
    @IBOutlet weak var typeFilter: UISegmentedControl!
    @IBOutlet weak var dirFilter: UISegmentedControl!
    
    var typeParam : String = "id"
    var dirParam : String = "desc"
    
    @IBAction func typeAction(_ sender: Any) {
        let filter = typeFilter.selectedSegmentIndex
        if filter == 0 {
            typeParam = "id"
        } else {
            typeParam = "name"
        }
        reloadPokedex(with: pokemonArray)
    }
    
    @IBAction func dirAction(_ sender: Any) {
        let filter = dirFilter.selectedSegmentIndex
        if filter == 0 {
            dirParam = "desc"
        } else {
            dirParam = "asc"
        }
        reloadPokedex(with: pokemonArray)
    }
    
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
        sortArray()
        pokemonList.reloadData()
    }
    
    func sortArray() {
        var sortedArray : [Pokemon] = self.pokemonArray
        if self.typeParam == "id" {
            if dirParam == "desc" {
                sortedArray = self.pokemonArray.sorted(by: {$0.pkmnId < $1.pkmnId});
            } else {
                sortedArray = self.pokemonArray.sorted(by: {$0.pkmnId > $1.pkmnId});
            }
        } else {
            if dirParam == "desc" {
                sortedArray = self.pokemonArray.sorted(by: {$0.name < $1.name});
            } else {
                sortedArray = self.pokemonArray.sorted(by: {$0.name > $1.name});
            }
        }
        self.pokemonArray = sortedArray
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
            fatalError("The dequeued cell is not an instance of PokemonTableViewCell.")
        }
        
        let currentPokemon = pokemonArray[indexPath.row]
        
        let pokemonViewModel = PokemonTableViewCellViewModel(cellIndex: indexPath.row, pokemonName: currentPokemon.name, pokemonId: currentPokemon.pkmnId, pokemonImageURL: currentPokemon.imgUrl)
        
        (cell as PokemonTableViewCell).viewModel = pokemonViewModel
        
//        cell.pkmnImage.image = currentPokemon.img
//        cell.pkmnName.text = currentPokemon.name
//        cell.pkmnId.text = "\(currentPokemon.pkmnId)"
        
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
