//
//  ContentView.swift
//  SwiftUI_Rick_Morty
//
//  Created by Luis Javier Canto Hurtado on 09/11/21.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var characterViewModel = CharacterViewModel()
    @StateObject var episodes = EpisodesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    CharactersView(characterViewModel: characterViewModel)
                        .tabItem {
                            Label("Characters", systemImage: "person.fill")
                        }
                    EpisodesView(episode: episodes)
                        .tabItem {
                            Label("Episodes", systemImage: "tv.fill")
                        }
                }
                .accentColor(.blue)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
