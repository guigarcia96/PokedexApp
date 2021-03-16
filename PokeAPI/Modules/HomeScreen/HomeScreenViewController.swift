//
//  ViewController.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 24/02/21.
//

import UIKit

class HomeScreenViewController: UIViewController, HomeScreenViewDelegate, Cordinating {
    var coordinator: Coordinator?
    
    let viewModel = HomeScreenViewModel()
    
    lazy var myView: HomeScreenView = {
        let view = HomeScreenView()
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view = myView
        view.backgroundColor = .darkGray
        title = "PokemonAPI"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .red
        viewModel.delegate = myView
        myView.viewModel = viewModel
    }
}

extension HomeScreenViewController {
    func didTapPokemon(at index: Int) {
        let pokemon = viewModel.returnTappedPokemon(at: index)
        coordinator?.goToDetailsScreen(poke: pokemon)
    }
}

