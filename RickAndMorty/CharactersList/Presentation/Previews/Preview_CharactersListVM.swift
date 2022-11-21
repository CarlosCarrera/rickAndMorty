//
//  Preview_CharactersListVM.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 31/10/22.
//

import Foundation

class Preview_CharactersListVM: CharactersListVMInterface {
    @Published var charactersResult: [CharacterVM] = []
    @Published var error: Error?
    
    func getCharacters() {
        charactersResult = [
            CharacterVM(id: 1,
                        name: "Rick Sanchez",
                        gender: "Male",
                        status: "Alive",
                        species: "Human",
                        origin: "Earth",
                        location: "Earth",
                        imagePath: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!),
            CharacterVM(id: 2,
                        name: "Morty Smith",
                        gender: "Male",
                        status: "Alive",
                        species: "Human",
                        origin: "Earth",
                        location: "Earth",
                        imagePath: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!),
            CharacterVM(id: 3,
                        name: "Rick Sanchez",
                        gender: "Male",
                        status: "Alive",
                        species: "Human",
                        origin: "Earth",
                        location: "Earth",
                        imagePath: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!),
            CharacterVM(id: 4,
                        name: "Morty Smith",
                        gender: "Male",
                        status: "Alive",
                        species: "Human",
                        origin: "Earth",
                        location: "Earth",
                        imagePath: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!),
            CharacterVM(id: 5,
                        name: "Rick Sanchez",
                        gender: "Male",
                        status: "Alive",
                        species: "Human",
                        origin: "Earth",
                        location: "Earth",
                        imagePath: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!),
            CharacterVM(id: 6,
                        name: "Morty Smith",
                        gender: "Male",
                        status: "Alive",
                        species: "Human",
                        origin: "Earth",
                        location: "Earth",
                        imagePath: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!)
        ]
    }
    
    func refresh() {}
    func dismissError() {}
}
