//
//  HomeScreenViewModel.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 24/02/21.
//

import Foundation
import UIKit

class HomeScreenViewModel {
    
    var pokemons:Pokemons?
    
    weak var delegate: HomeScreenView?
    
    init() {
        getPokemons()
    }
    
    func getPokemons() {
        let pokemonsService = PokemonsService()
        pokemonsService.getPokemonsList{ [weak self](result) in
            switch result {
            case .success(let pokemons):
                self?.pokemons = pokemons
                self?.delegate?.reloadData()
            case .failure:
                print("No Pokemons were returned")
            }
            
        }
        }
    
    func getPokemonId(indice: Int) -> String {
        var myString = ""
        if let pokemon = pokemons?.results {
            myString = pokemon[indice].url
            var myStringIntoArray = myString.components(separatedBy: "/").dropLast()
            myString = myStringIntoArray.removeLast()
        }
        return myString
    }
    
    func generateRandomColor() -> UIColor {
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        return randomColor
    }
    
    }
   

