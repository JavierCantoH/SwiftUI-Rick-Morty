//
//  EpisodesViewModel.swift
//  SwiftUI_Rick_Morty
//
//  Created by Luis Javier Canto Hurtado on 09/11/21.
//

import SwiftUI
import Alamofire

class EpisodesViewModel: ObservableObject{
    
    @Published var episodes = [Episode]()
    
    init(){
        loadEpisodes()
    }
    
    func loadEpisodes(){
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else {
            fatalError("La url no es correcta o no se ha podido acceder")
        }
        
        AF.request(url, method: .get, encoding: URLEncoding.default).validate().validate(statusCode: 200..<300).responseData{
            data in
            let json = try! JSON(data: data.data!)
            //            print(json)
            var episode: Episode
            for episodio in json["results"]{
                episode = Episode(
                    id: episodio.1["id"].intValue,
                    name: episodio.1["name"].stringValue,
                    air_date: episodio.1["air_date"].stringValue
                )
                self.episodes.append(episode)
            }
            
            for episode in self.episodes {
                print("\(episode)")
            }
        }
    }
}
