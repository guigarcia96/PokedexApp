//
//  MainCoordinator.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 16/03/21.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    func goToDetailsScreen(poke: Results, color: UIColor) {
        let viewModel = DetailsScreenViewModel(pokemon: poke, color: color)
        let vc = DetailsScreenViewController(viewModel: viewModel)
        viewModel.set(controller: vc)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func start() {
        var vc:UIViewController & Cordinating = HomeScreenViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: true)
    }
}
