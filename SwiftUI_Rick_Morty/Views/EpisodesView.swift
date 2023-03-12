//
//  EpisodesView.swift
//  SwiftUI_Rick_Morty
//
//  Created by Luis Javier Canto Hurtado on 09/11/21.
//

import SwiftUI

struct EpisodesView: View {
    
    @ObservedObject var episode: EpisodesViewModel
    
    var body: some View {
            VStack {
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack {
                        ForEach(episode.episodes) { episode in
                            VStack {
                                Text(episode.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.top,30)
                                Text(episode.air_date)
                                    .font(.headline)
                                Spacer()
                            }
                            .padding(.horizontal,10)                        }
                    }
                })
            }
            .navigationBarTitleDisplayMode(.inline)
            
        
    }
    
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesView(episode: EpisodesViewModel())
    }
}
