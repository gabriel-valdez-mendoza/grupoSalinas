//
//  ServerResponse+enum.swift
//  BancaDigital
//
//  Created by Jorge Parra on 22/08/21.
//


enum ServerResponse {
    case error
    case succesfull(list : [APIShowsResponseElement])
    case core(list : [FavoriteShows] )
}


enum typeOfCall : Int{
    case server
    case coredata
}
