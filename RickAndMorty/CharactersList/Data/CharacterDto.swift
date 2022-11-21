//
//  CharacterDto.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 27/10/22.
//

import Foundation

struct CharacterDto: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: LocationDto
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct LocationDto: Codable {
    let name: String
    let url: String
}
