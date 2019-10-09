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
    
    @IBOutlet weak var tvListPokemon: UITableView!
    
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
    }
}
