//
//  CharacterDetailService.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 8/11/22.
//

import Foundation

struct CharacterDetailService: CharacterDetailServiceInterface {
    let database: DataManagerInterface
    let repository: CharacterDetailRepositoryInterface
    
    init(database: DataManagerInterface = DatabaseManager.shared,
         repository: CharacterDetailRepositoryInterface = CharacterDetailRepository()) {
        self.database = database
        self.repository = repository
    }
    
    func getCharacter(id: Int) async throws -> Character {
        do {
            let characterMO = try await database.fetchCharacter(id: id)
            return Character(from: characterMO)
        } catch {
            guard let url = API.character(id: id).url else {
                throw ServiceError.invalidURL
            }
            let characterDto = try await repository.fetchCharacter(url: url)
            return Character(from: characterDto)
        }
    }
}
