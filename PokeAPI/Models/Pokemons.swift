//
//  Pokemons.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 24/02/21.
//

import Foundation

// MARK: - Welcome
struct Pokemons: Codable {
    let count: Int
    let next, previous: String?
    let results: [Results]?
}

// MARK: - Result
struct Results: Codable {
    let name: String
    let url: String
}
