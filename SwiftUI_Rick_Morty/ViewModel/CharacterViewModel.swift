//
//  CharacterViewModel.swift
//  SwiftUI_Rick_Morty
//
//  Created by Luis Javier Canto Hurtado on 09/11/21.
//

import SwiftUI
import Alamofire

class CharacterViewModel: ObservableObject{
    
    @Published var characters = [Character]()
    
    init(){
        loadCharacters()
    }
    
    func loadCharacters(){
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            fatalError("La url no es correcta o no se ha podido acceder")
        }
        
        AF.request(url, method: .get, encoding: URLEncoding.default).validate().validate(statusCode: 200..<300).responseData{
            data in
            let json = try! JSON(data: data.data!)
            //            print(json)
            var character: Character
            for personaje in json["results"]{
                character = Character(
                    id: personaje.1["id"].intValue,
                    name: personaje.1["name"].stringValue,
                    image: personaje.1["image"].stringValue,
                    status: personaje.1["status"].stringValue,
                    species: personaje.1["species"].stringValue,
                    gender: personaje.1["gender"].stringValue
                )
                self.characters.append(character)
            }
            
            for character in self.characters {
                print("\(character)")
            }
        }
    }
}
