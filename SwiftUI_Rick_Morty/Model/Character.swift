//
//  Character.swift
//  SwiftUI_Rick_Morty
//
//  Created by Luis Javier Canto Hurtado on 09/11/21.
//

import SwiftUI


public struct Character: Identifiable {
    public var id = Int().self
    public var name = String().self
    public var image = String().self
    public var status = String().self
    public var species = String().self
    public var gender = String().self
}


extension Character{
    static let dummy = Character(id: 0, name: "---", image: "---", status: "---", species: "---", gender: "---")
}
