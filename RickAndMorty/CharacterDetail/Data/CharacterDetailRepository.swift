//
//  CharacterDetailRepository.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 11/11/22.
//

import Foundation

protocol CharacterDetailRepositoryInterface {
    func fetchCharacter(url: URL) async throws -> CharacterDto
}

struct CharacterDetailRepository: CharacterDetailRepositoryInterface{
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func fetchCharacter(url: URL) async throws -> CharacterDto {
        let (data, _) = try await session.data(from: url)
        return try JSONDecoder().decode(CharacterDto.self, from: data)
    }
}
