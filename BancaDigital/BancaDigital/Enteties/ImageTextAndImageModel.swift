//
//  ImageTextAndImageModel.swift
//  BancaDigital
//
//  Created by Jorge Parra on 20/08/21.
//

import Foundation
struct ImageTextAndImageModel : Identifiable {
    var id  : Int
    var text : String
    var urlStringLeftImage : String
    var stringRightImage : String
    var isFavorite : Bool = false
    var select : () -> Void
   //MOCK Data constructor
    init() {
        id  = 1000
        self.text = "hello"
        urlStringLeftImage = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png"
        stringRightImage = ""
        select = { print("clossure") }
    }
    
    init(name : String ,url :String , isFavorite : Bool , id : Int) {
        text = name
        urlStringLeftImage = url
        self.id = id
        self.isFavorite = isFavorite
        stringRightImage = ""
        select = { print("clossure") }
    }
    
    mutating func changeIsFavorite(status : Bool){
        isFavorite = status
    }
    
}
