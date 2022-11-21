//
//  DataManager.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 8/11/22.
//

import Foundation

import CoreData
import Foundation

protocol DataManagerInterface {
    func fetchCharacter(id: Int) async throws -> CharacterMO
    func fetchCharacters() async throws -> [CharacterMO]
    func saveCharacters(characters: [CharacterDto]) async throws
}

enum DataManagerError: Error {
    case invalidEntity
    case invalidData
}

class DatabaseManager: DataManagerInterface {
    static var shared = DatabaseManager()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "RickAndMortyModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchCharacters() async throws -> [CharacterMO] {
        try await container.viewContext.perform { [weak self] in
            let fetchRequest = CharacterMO.fetchRequest()
//            fetchRequest.fetchOffset = (page * 20)
//            fetchRequest.fetchLimit = 20
//            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
            guard let result = try self?.container.viewContext.fetch(fetchRequest) as? [CharacterMO] else {
                throw DataManagerError.invalidEntity
            }
            return result
        }
    }
    
    func fetchCharacter(id: Int) async throws -> CharacterMO {
        try await container.viewContext.perform { [weak self] in
            let fetchRequest = CharacterMO.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id = %@ ", String(id))
            
            guard let result = try self?.container.viewContext.fetch(fetchRequest).first as? CharacterMO else {
                throw DataManagerError.invalidEntity
            }
            return result
        }
    }
    
    func saveCharacters(characters: [CharacterDto]) async throws {
        characters.forEach { character in
            let characterMO = CharacterMO(context: container.viewContext)
            characterMO.id = Int16(character.id)
            characterMO.name = character.name
            characterMO.gender = character.gender
            characterMO.location = character.location.name
            characterMO.origin = character.origin.name
            characterMO.status = character.status
            characterMO.species = character.species
            characterMO.imagePath = character.image
        }
        
        do {
            try container.viewContext.save()
        } catch {
            container.viewContext.undo()
            throw DataManagerError.invalidData
        }
    }
}
