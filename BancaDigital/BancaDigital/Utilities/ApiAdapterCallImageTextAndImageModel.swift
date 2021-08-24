//
//  ApiAdapterCallImageTextAndImageModel.swift
//  BancaDigital
//
//  Created by Jorge Parra on 22/08/21.
//

import Foundation
class ApiAdapterCallImageTextAndImageModel{
    
    private var listImageTextAndImageModel :  [ImageTextAndImageModel]
    private var listAPIShowsResponseElement :  [APIShowsResponseElement]
    init(_ response: [APIShowsResponseElement]) {
        listImageTextAndImageModel = response.map{
            ImageTextAndImageModel(name: $0.name, url: $0.image.medium, isFavorite: false, id: $0.id)
        }
        listAPIShowsResponseElement = response
    }
    
    func getList() -> [ImageTextAndImageModel] {
  
        return listImageTextAndImageModel
    }
    func getAPIShowsResponseElement(with index : Int ) -> APIShowsResponseElement{
        return listAPIShowsResponseElement[index]
    }
}
