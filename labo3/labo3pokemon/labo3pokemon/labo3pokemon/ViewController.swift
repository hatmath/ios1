//
//  ViewController.swift
//  labo3pokemon
//
//  Created by Simon Turcotte (Étudiant) on 2023-06-20.
//

import UIKit

let pokemons = ["pikachu", "ditto", "charizard", "poliwrath"]

class ViewController: UIViewController {
    var counter = 0;
    
    @IBOutlet weak var textViewer: UILabel!
    @IBOutlet weak var imageViewer: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.click))
        tapGesture.numberOfTapsRequired = 1
        imageViewer.addGestureRecognizer(tapGesture)
        imageViewer.isUserInteractionEnabled = true
        
    }
    @objc func click() {
        PokemonDownloader.shared.downloadPokemonData(for: pokemons.randomElement()!) { pokemon in
            guard let pokemon = pokemon else {
                print("Error: Invalid data")
                return
            }
            ImageDownloader.shared.downloadImage(URL(string: pokemon.imageURL)!) { image in
                DispatchQueue.main.async {
                    self.imageViewer.image = image
                    self.textViewer.text = "ID: \(pokemon.id) - Name: \(pokemon.name)"
                }
            }
        }
    }
}

