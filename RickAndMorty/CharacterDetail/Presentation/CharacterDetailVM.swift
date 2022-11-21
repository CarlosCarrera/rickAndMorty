//
//  CharacterDetailVM.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 8/11/22.
//

import Foundation

protocol CharacterDetailServiceInterface {
    func getCharacter(id: Int) async throws -> Character
}

class CharacterDetailVM: CharacterDetailVMInterface {
    let detailService: CharacterDetailServiceInterface
    let id: Int
    
    @Published var characterResult: CharacterVM = .empty
    
    init(id: Int, detailService: CharacterDetailServiceInterface = CharacterDetailService()) {
        self.detailService = detailService
        self.id = id
    }
    
    @MainActor
    func getCharacter() {
        Task {
            do {
                let result = try await detailService.getCharacter(id: id)
                self.characterResult = CharacterVM(from: result)
            } catch {
                //TODO: Handle error
            }
        }
    }
}
