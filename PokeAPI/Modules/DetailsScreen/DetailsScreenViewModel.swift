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
}

class DetailsScreenViewModel {
    
    weak var delegate: DetailsScreenView?
    var pokemon: Results?
    var poke: Pokemon?
    var controller: DetailsScreenViewControllerContract?
    
    init(pokemon: Results) {
        self.pokemon = pokemon
        didLoad()
    }
    func getPokemons(url: String) {
        let pokemonsService = PokemonService()
        pokemonsService.getPokemon(url: url){ [weak self](result) in
            switch result {
            case .success(let pokemon):
                self?.poke = pokemon
                if let batata = self?.poke {
                    self?.controller?.setup(with: batata)
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
    func didLoad() {
        getPokemons(url: pokemon?.url ?? "")
    }
}

