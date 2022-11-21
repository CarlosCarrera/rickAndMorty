//
//  CharctersServiceTests.swift
//  RickAndMortyTests
//
//  Created by Carlos Carrera on 20/11/22.
//

import XCTest
@testable import RickAndMorty

class CharctersServiceTests: XCTestCase {
    var sut: CharactersService!
    
    func testGetCharacters() async throws {
        let repository = PaginatedDataRepositoryMock()
        let database = DatabaseManagerMock()
        sut = CharactersService(repository: repository, database: database)
        let result = try await sut.getCharacters(page: 1)
        
        XCTAssert(database.saveCharactersCalled)
        XCTAssertNotNil(result)
    }
}


class PaginatedDataRepositoryMock: PaginatedDataRepositoryInterface {
    func fetchData(url: URL, page: Int) async throws -> RickAndMorty.PaginatedResultDto {
        let characterDto = CharacterDto(id: 1, name: "Rick Sanchez",
                                        status: "Alive", species: "Human",
                                        type: "Human", gender: "Male",
                                        origin: LocationDto(name: "Earth", url: ""),
                                        location: LocationDto(name: "Earth", url: ""),
                                        image: "", episode: [], url: "", created: "")
        
        return PaginatedResultDto(info: PaginatedRequestInfoDto(count: 1, pages: 20, next: "", prev: nil), results: [characterDto])
    }
}

class DatabaseManagerMock: DataManagerInterface {
    var saveCharactersCalled = false
    
    func fetchCharacter(id: Int) async throws -> RickAndMorty.CharacterMO {
        fatalError()
    }
    
    func fetchCharacters() async throws -> [RickAndMorty.CharacterMO] {
        return []
    }
    
    func saveCharacters(characters: [RickAndMorty.CharacterDto]) async throws {
        saveCharactersCalled = true
    }
}
