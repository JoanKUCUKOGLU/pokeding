//
//  PokemonTableViewCell.swift
//  pokedex
//
//  Created by Kucukoglu Joan on 08/10/2019.
//  Copyright © 2019 Kucukoglu Joan. All rights reserved.
//

import UIKit

class PokemonTableViewCell : UITableViewCell {
    
    @IBOutlet weak var pkmnImage: UIImageView!
    @IBOutlet weak var pkmnName: UILabel!
    @IBOutlet weak var pkmnId: UILabel!
    
    var cellIndex: Int = 0
    
    var viewModel: PokemonTableViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            
            cellIndex = viewModel.cellIndex
            pkmnName.text = viewModel.pokemonName
            pkmnId.text = viewModel.pokemonId
            
            ImageDownloader.download(imageURLString: viewModel.pokemonImageURL) { [weak self] result in
                if self?.cellIndex == viewModel.cellIndex {
                    switch result {
                    case .success(let image) :
                        self?.pkmnImage.image = image
                    case .failure:
                        self?.pkmnImage.image = UIImage(named: "missingNo")
                    }
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        pkmnImage.image = nil
        pkmnName.text = nil
        pkmnId.text = nil
    }
}
