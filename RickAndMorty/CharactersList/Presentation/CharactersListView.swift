//
//  CharactersListView.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 27/10/22.
//

import SwiftUI
import CachedAsyncImage

protocol CharactersListVMInterface: ObservableObject {
    func getCharacters()
    func refresh()
    func dismissError()
    var charactersResult: [CharacterVM] { get }
    var error: Error? { get set }
}

struct CharactersListView<VM>: View where VM: CharactersListVMInterface {
    @ObservedObject var viewModel: VM
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)
                    ], spacing: 20) {
                        ForEach(viewModel.charactersResult, id: \.id) { character in
                            NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailVM(id: character.id))) {
                                CharacterListCellView(viewModel: character)
                            }
                        }
                        if !viewModel.charactersResult.isEmpty {
                            ProgressView()
                                .onAppear {
                                    viewModel.getCharacters()
                                }
                        }
                    }
                    .navigationDestination(for: Color.self) { color in
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 30 , bottom: 0, trailing: 30))
                .refreshable {
                    viewModel.refresh()
                }
            }
        }
        .accentColor(.black)
        .onAppear {
            viewModel.getCharacters()
        }
        .alert(isPresented: Binding(get: { viewModel.error != nil },
                                    set: { _ in })) {
            Alert(
                title: Text("Error"),
                message: Text("Something wrong happened!"),
                dismissButton: .cancel {
                    viewModel.dismissError()
                })
        }
    }
}

struct CharacterListCellView: View {
    let viewModel: CharacterVM
    
    var body: some View {
        VStack(spacing: 8) {
            CachedAsyncImage(url: viewModel.imagePath, content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            }) {
                ProgressView()
            }
            Text(viewModel.name)
                .foregroundColor(.black)
                .lineLimit(1)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        let fakeVM = Preview_CharactersListVM()
        CharactersListView(viewModel: fakeVM)
    }
}
