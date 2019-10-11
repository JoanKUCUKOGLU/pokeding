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
    @IBOutlet weak var pkmnDesc: UILabel!
    
    var pokemon : Pokemon = Pokemon()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pkmnIdLabel.text = "#\(pokemon.pkmnId)"
        pkmnNameLabel.text = pokemon.name
        pkmnDesc.text = pokemon.description
        
        ImageDownloader.download(imageURLString: pokemon.imgUrl) { [weak self] result in
            switch result {
            case .success(let image) :
                self?.pkmnImage.image = image
            case .failure:
                self?.pkmnImage.image = UIImage(named: "missingNo")
            }
        }
        
        print(pokemon.types)
        pkmnType1Image.image = UIImage(named: pokemon.types[0].rawValue) ?? UIImage(named: "missingNo")!
        if pokemon.types.count > 1 {
            pkmnType2Image.image = UIImage(named: pokemon.types[1].rawValue) ?? UIImage(named: "missingNo")!
        }
        
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
