//
//  pokemonDownloader.swift
//  labo3pokemon
//
//  Created by Simon Turcotte (Étudiant) on 2023-06-20.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let id: Int
    let sprites: Sprites
    var imageURL : String {
    return self.sprites.front_default
    }
}

struct Sprites: Decodable {
    let front_default : String
}

class PokemonDownloader {
    
    static let shared = PokemonDownloader()
    private init() {}
    
    func downloadPokemonData(for name: String, completion: @escaping (Pokemon?) ->
                             Void) {
        
        let urlRef = "https://pokeapi.co/api/v2/pokemon/\(name)"
        guard let url = URL(string: urlRef) else {
            print("Invalid URL: \(urlRef)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let pokemon = try decoder.decode(Pokemon.self, from: data)
                    DispatchQueue.main.async {
                        completion(pokemon)
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }
        task.resume()
    }
}
