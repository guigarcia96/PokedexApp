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
    var poke:[Results] = []
    var fetchInProgress:Bool = false
    
    weak var delegate: HomeScreenView?
    
    init() {
        getPokemons()
    }
    
    func getPokemons() {
        let pokemonsService = PokemonsService()
        guard !fetchInProgress else {return}
        fetchInProgress = true
        pokemonsService.getPokemonsList{ [weak self](result) in
            switch result {
            case .success(let pokemons):
                self?.pokemons = pokemons
                if let pokemon = pokemons.results {
                    self?.poke = pokemon
                }
                self?.delegate?.reloadData()
                self?.fetchInProgress = false
            case .failure:
                print("No Pokemons were returned")
            }
            
        }
    }
    
    func getPokemonId(indice: Int) -> String {
        var myString = ""
        myString = poke[indice].url
        var myStringIntoArray = myString.components(separatedBy: "/").dropLast()
        myString = myStringIntoArray.removeLast()
        return myString
    }
    
    func getPokemons(url: String) {
        let pokemonsService = PokemonsService()
        if !fetchInProgress {
            pokemonsService.getPokemonsList(url: url){ [weak self](result) in
                switch result {
                case .success(let pokemons):
                    self?.pokemons = pokemons
                    if let pokemon = pokemons.results {
                        self?.poke += pokemon
                    }
                    self?.delegate?.reloadData()
                    self?.fetchInProgress = false
                    self?.delegate?.reloadData()
                case .failure:
                    print("No Pokemons were returned")
                }
                
            }
        } else {
            return
        }
    }
    func getPokemonsCount() -> Int {
        return poke.count
    }
    func generateRandomColor() -> UIColor {
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        return randomColor
    }
    
}


