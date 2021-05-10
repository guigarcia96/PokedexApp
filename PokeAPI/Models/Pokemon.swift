//
//  Pokemon.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 16/03/21.
//

import Foundation

// MARK: - Pokemon
struct Pokemon: Codable {
    let height: Int
    let name: String
    let sprites: Sprites
    let stats: [StatElement]
    let types: [TypeElement]
    let weight: Int
}

// MARK: - Sprites
struct Sprites: Codable {
    let other: Other
}

struct Other: Codable {
    let officialArtwork: OfficialArtwork
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// MARK: - StatElement
struct StatElement: Codable {
    let baseStat, effort: Int
    let stat: TypeClass
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: - TypeClass
struct TypeClass: Codable {
    let name: String
    let url: String
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int
    let type: TypeClass
}
