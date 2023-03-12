//
//  CharacterDetailView.swift
//  SwiftUI_Rick_Morty
//
//  Created by Luis Javier Canto Hurtado on 09/11/21.
//

import SwiftUI
import Kingfisher

struct CharacterDetailView: View {
    
    @ObservedObject var character: CharacterViewModel
    
    var personaje: Character
    
    var body: some View {
        GeometryReader { geo in
        VStack {
            Text(personaje.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            
            Text("Gender: \(personaje.gender)")
                .font(.headline)
            Text("Species: \(personaje.species)")
                .font(.headline)
            Text("Status: \(personaje.status)")
                .font(.headline)
            
            ScrollView(.vertical, showsIndicators: false) {
                KFImage(URL(string: "\(personaje.image)"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width-20)
            }
        }
        .padding(.horizontal,10)
        .navigationBarTitle("Character")
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: CharacterViewModel(), personaje: Character.dummy)
    }
}
