//
//  DetailsScreenViewModel.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 02/03/21.
//

import Foundation
import UIKit

protocol DetailsScreenViewModelContract {
    func didLoad()
    func returnSelectedColor() -> UIColor
}

class DetailsScreenViewModel {
    
    weak var delegate: DetailsScreenView?
    var pokemon: Results?
    var poke: Pokemon?
    var color: UIColor?
    var controller: DetailsScreenViewControllerContract?
    
    init(pokemon: Results, color: UIColor) {
        self.pokemon = pokemon
        self.color = color
        didLoad()
    }
    func getPokemons(url: String) {
        let pokemonsService = PokemonService()
        pokemonsService.getPokemon(url: url){ [weak self](result) in
            switch result {
            case .success(let pokemon):
                self?.poke = pokemon
                if let poke = self?.poke, let color = self?.color {
                    self?.controller?.setup(with: poke, color: color)
                }
            case .failure:
                print("No Pokemons were returned")
            }
        }
    }
    
    func set(controller: DetailsScreenViewController) {
        self.controller = controller
    }
}

extension DetailsScreenViewModel: DetailsScreenViewModelContract {
    func returnSelectedColor() -> UIColor {
        return color ?? UIColor.red
    }
    
    func didLoad() {
        getPokemons(url: pokemon?.url ?? "")
    }
}

