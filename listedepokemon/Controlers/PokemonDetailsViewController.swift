//
//  PokemonDetailsViewController.swift
//  listedepokemon
//
//  Created by Verbeke Yanis on 10/10/2019.
//  Copyright © 2019 Kucukoglu Joan. All rights reserved.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    
    @IBOutlet weak var pkmnIdLabel: UILabel!
    @IBOutlet weak var pkmnNameLabel: UILabel!
    @IBOutlet weak var pkmnImage: UIImageView!
    @IBOutlet weak var pkmnType1Image: UIImageView!
    @IBOutlet weak var pkmnType2Image: UIImageView!
    
    var pokemon : Pokemon = Pokemon()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pkmnIdLabel.text = pokemon.pkmnId
        pkmnNameLabel.text = pokemon.name
        pkmnImage.image = pokemon.imgUrl
        print("pouet \(pokemon.name)")
        print("le sang de tes morts langage de *****")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
