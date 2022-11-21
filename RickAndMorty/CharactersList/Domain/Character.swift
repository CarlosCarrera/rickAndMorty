//
//  Character.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 8/11/22.
//

import Foundation

struct Character {
    let id: Int
    let name: String
    let gender: String
    let status: String
    let species: String
    let origin: String
    let location: String
    let imagePath: String
    
    init(id: Int, name: String,
         gender: String, status: String,
         species: String, origin: String,
         location: String, imagePath: String) {
        self.id = id
        self.name = name
        self.gender = gender
        self.status = status
        self.species = species
        self.origin = origin
        self.location = location
        self.imagePath = imagePath
    }
    
    init(from characterDto: CharacterDto) {
        self.id = characterDto.id
        self.name = characterDto.name
        self.gender = characterDto.gender
        self.status = characterDto.status
        self.species = characterDto.species
        self.origin = characterDto.origin.name
        self.location = characterDto.location.name
        self.imagePath = characterDto.image
    }
    
    init(from characterMO: CharacterMO) {
        self.id = Int(characterMO.id)
        self.name = characterMO.name
        self.gender = characterMO.gender
        self.status = characterMO.status
        self.species = characterMO.species
        self.origin = characterMO.origin
        self.location = characterMO.location
        self.imagePath = characterMO.imagePath
    }
}
