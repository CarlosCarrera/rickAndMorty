//
//  CharactersRepository.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 27/10/22.
//

import Foundation

struct PaginatedResultDto: Codable {
    let info: PaginatedRequestInfoDto
    let results: [CharacterDto]
}

struct PaginatedRequestInfoDto: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}

struct PaginatedDataRepository: PaginatedDataRepositoryInterface {
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func fetchData(url: URL, page: Int) async throws -> PaginatedResultDto {
        let requestUrl = url.appending(queryItems: [URLQueryItem(name: "page", value: String(page))])
        let (data, _) = try await session.data(from: requestUrl)
        return try JSONDecoder().decode(PaginatedResultDto.self, from: data)
    }
}
