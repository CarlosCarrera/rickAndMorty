//
//  CharacterVM.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 11/11/22.
//

import Foundation

struct CharacterVM: Identifiable {
    let id: Int
    let name: String
    let gender: String
    let status: String
    let species: String
    let origin: String
    let location: String
    let imagePath: URL?
    
    init(id: Int, name: String,
         gender: String, status: String,
         species: String, origin: String,
         location: String, imagePath: URL?) {
        self.id = id
        self.name = name
        self.gender = gender
        self.status = status
        self.species = species
        self.origin = origin
        self.location = location
        self.imagePath = imagePath
    }
    
    init(from entity: Character) {
        self.id = entity.id
        self.name = entity.name
        self.gender = entity.gender
        self.status = entity.status
        self.species = entity.species
        self.origin = entity.origin
        self.location = entity.location
        self.imagePath = URL(string: entity.imagePath)
    }
    
    static var empty: Self = {
        .init(id: 0, name: "",
              gender: "", status: "",
              species: "", origin: "",
              location: "", imagePath: nil)
    }()
    
    func characterDetailsList() -> [(key: String, value: String)] {
        ["Gender": gender.capitalized,
         "Status": status.capitalized,
         "Species": species.capitalized,
         "Origin": origin.capitalized,
         "Location": location.capitalized].sorted(by: <)
    }
}
