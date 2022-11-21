//
//  CharactersListVM.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 31/10/22.
//

import Foundation

protocol CharactersServiceInterface {
    func getCharacters(page: Int) async throws -> [Character]
}

class CharactersListVM: CharactersListVMInterface {
    let charactersService: CharactersServiceInterface
    
    @Published var charactersResult: [CharacterVM] = []
    @Published var error: Error?
    private var currentPage = 1
    private(set) var lastPage = false
    
    init(charactersService: CharactersServiceInterface = CharactersService()) {
        self.charactersService = charactersService
    }
    
    @MainActor
    func getCharacters() {
        Task {
            do {
                let result = try await charactersService.getCharacters(page: currentPage)
                lastPage = result.count < 20
                currentPage += 1
                let charactersVM = result.map { CharacterVM(from: $0) }
                charactersResult.append(contentsOf: charactersVM)
            } catch(let error) {
                self.error = error
            }
        }
    }
    
    func dismissError() {
        error = nil
    }
    
    @MainActor
    func refresh() {
        charactersResult = []
        currentPage = 1
        lastPage = false
        
        getCharacters()
    }
}
