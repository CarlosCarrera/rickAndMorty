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
    
    init(repository: PaginatedDataRepositoryInterface = PaginatedDataRepository()) {
        self.repository = repository
    }
    
    func getCharacters(page: Int) async throws -> [Character] {
        guard let url = API.characters.url else {
            throw ServiceError.invalidURL
        }
        
        let paginatedResult = try await repository.fetchData(url: url, page: page)
        return paginatedResult.results.map { Character(from: $0) }
    }
}
