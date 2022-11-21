//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Carlos Carrera on 8/11/22.
//

import SwiftUI

protocol CharacterDetailVMInterface: ObservableObject {
    func getCharacter()
    var characterResult: CharacterVM { get set }
}

struct CharacterDetailView<VM>: View where VM: CharacterDetailVMInterface  {
    @ObservedObject var viewModel: VM
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                CharacterListCellView(viewModel: viewModel.characterResult)
                    .border(.black, width: 4)
                
                Text("Details")
                    .bold()
                    .font(.title)
                
                ForEach(viewModel.characterResult.characterDetailsList(), id: \.key) { key, detail in
                    HStack {
                        Text("\(key):")
                            .bold()
                            .font(.title3)
                        Text(detail)
                            .font(.subheadline)
                        Spacer()
                    }
                }
                .padding()
                .border(.black, width: 4)
                .background(Color.white)
            }
            .padding(24)
        }
        .onAppear{
            viewModel.getCharacter()
        }
        
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(viewModel: Preview_CharacterDetailVM())
    }
}
