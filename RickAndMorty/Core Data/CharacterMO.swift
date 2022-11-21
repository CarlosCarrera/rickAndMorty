//
//  CharacterMO.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 8/11/22.
//

import Foundation
import CoreData

@objc(CharacterMO)
class CharacterMO: NSManagedObject {
    @NSManaged public var id: Int16
    @NSManaged public var name: String
    @NSManaged public var gender: String
    @NSManaged public var status: String
    @NSManaged public var species: String
    @NSManaged public var origin: String
    @NSManaged public var location: String
    @NSManaged public var imagePath: String
}
