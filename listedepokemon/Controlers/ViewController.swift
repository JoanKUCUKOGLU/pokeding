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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var listPkmn : [Pokemon] = [Pokemon()]
        
        if let myurl = Bundle.main.path(forResource: "pokemon", ofType: "json") {
    
            let url = URL(fileURLWithPath: myurl)
            Alamofire.request(url).responseJSON { response in
            if let jsonResponse = response.result.value {
                print(jsonResponse)
                let json = JSON(jsonResponse)
                listPkmn = JsonParse().parsePkm(json: json)
                print(listPkmn)
                
                for i in 0...listPkmn.count-1 {
                    print(listPkmn[i].id)
                    print(listPkmn[i].name)
                    print(listPkmn[i].description)
                    print(listPkmn[i].pkmnId)
                    
                    }
                }
            }
        }
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
        
        cell.pkmnImage.image = currentPokemon.img
        cell.pkmnName.text = currentPokemon.name
        cell.pkmnId.text = currentPokemon.id
        
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
