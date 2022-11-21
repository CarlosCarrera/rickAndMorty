//
//  CharacterDetailVM.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 8/11/22.
//

import Foundation

class CharacterDetailVM: CharacterDetailVMInterface {
    @Published var characterResult: CharacterVM = .empty
    
    init(character: CharacterVM) {
        self.characterResult = character
    }
}
