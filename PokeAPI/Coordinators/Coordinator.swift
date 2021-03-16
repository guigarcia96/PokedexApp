//
//  AppCordinator.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 03/03/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? {get set}
    func start()
    func goToDetailsScreen(poke: Results)
}

protocol Cordinating {
    var coordinator:Coordinator? {get set}
}
