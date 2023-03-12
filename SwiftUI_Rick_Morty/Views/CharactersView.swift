//
//  CharactersView.swift
//  SwiftUI_Rick_Morty
//
//  Created by Luis Javier Canto Hurtado on 09/11/21.
//

import SwiftUI
import Kingfisher

struct CharactersView: View {
    
    @ObservedObject var characterViewModel: CharacterViewModel
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        ForEach(characterViewModel.characters) { character in
                            
                            NavigationLink(destination: CharacterDetailView(character: characterViewModel, personaje: character)) {
                                VStack{
                                    KFImage(URL(string: "\(character.image)"))
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geo.size.width-20)
                                        .cornerRadius(20)
                                    
                                    
                                    Text(character.name)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding(.top,30)
                                    Spacer()
                                }
                                .padding(.horizontal,10)
                            }
                        }
                    }
                })
                Text("Swipe Right")
                    .font(.headline)
                    .padding(.bottom, 120)

            }
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView(characterViewModel: CharacterViewModel())
    }
}

