//
//  API.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 11/11/22.
//

import Foundation

enum API {
    case character(id: Int)
    case characters
    
    private var baseUrl: String {
        "https://rickandmortyapi.com/api"
    }
    
    var url: URL? {
        switch self {
        case .characters:
            return URL(string: baseUrl + "/character")
        case .character(let id):
            return URL(string: baseUrl + "/character/\(id)")
        }
    }
}
