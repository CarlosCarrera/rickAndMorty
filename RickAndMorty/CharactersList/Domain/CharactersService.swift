//
//  CharactersService.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 27/10/22.
//

import Foundation

enum ServiceError: Error {
    case invalidURL
    case invalidData
}

protocol PaginatedDataRepositoryInterface  {
    func fetchData(url: URL, page: Int) async throws -> PaginatedResultDto
}

struct CharactersService: CharactersServiceInterface {
    let repository: PaginatedDataRepositoryInterface
    let database: DataManagerInterface
    
    init(repository: PaginatedDataRepositoryInterface = PaginatedDataRepository(),
         database: DataManagerInterface = DatabaseManager.shared) {
        self.repository = repository
        self.database = database
    }
    
    func getCharacters(page: Int) async throws -> [Character] {
        guard let url = API.characters.url else {
            throw ServiceError.invalidURL
        }
        
        let paginatedResult = try await repository.fetchData(url: url, page: page)
        try await database.saveCharacters(characters: paginatedResult.results)
        return paginatedResult.results.map { Character(from: $0) }
    }
}
