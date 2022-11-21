//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 27/10/22.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    var body: some Scene {
        WindowGroup {
            CharactersListView(viewModel: CharactersListVM())
        }
    }
}
