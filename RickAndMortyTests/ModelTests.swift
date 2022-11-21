//
//  ModelTests.swift
//  RickAndMortyTests
//
//  Created by Carlos Carrera on 8/11/22.
//

import XCTest
import CoreData
@testable import RickAndMorty

class ModelTests: XCTestCase {
    func testFetchCharacters() async throws {
        let persistence = DatabaseManager(inMemory: true)
        let context = persistence.container.viewContext
        
        let characterDto = CharacterDto(id: 1, name: "Rick Sanchez",
                                        status: "Alive", species: "Human",
                                        type: "Human", gender: "Male",
                                        origin: LocationDto(name: "Earth", url: ""),
                                        location: LocationDto(name: "Earth", url: ""),
                                        image: "", episode: [], url: "", created: "")
        
        try await persistence.saveCharacters(characters: [characterDto])

        let result = try await persistence.fetchCharacter(id: 1)
        
        XCTAssertNotNil(result)
    }
}
