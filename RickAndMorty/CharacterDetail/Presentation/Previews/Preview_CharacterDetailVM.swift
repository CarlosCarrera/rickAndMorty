//
//  Preview_CharacterDetailVM.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 16/11/22.
//

import Foundation

class Preview_CharacterDetailVM: CharacterDetailVMInterface {
    @Published var characterResult: CharacterVM = .empty
    
    func getCharacter() {
        characterResult = CharacterVM(id: 1,
                    name: "Rick Sanchez",
                    gender: "Male",
                    status: "Alive",
                    species: "Human",
                    origin: "Earth",
                    location: "Earth",
                    imagePath: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!)
    }
}
