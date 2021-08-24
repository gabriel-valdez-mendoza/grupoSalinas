//
//  NetworkManager.swift
//  BancaDigital
//
//  Created by Jorge Parra on 20/08/21.
//

import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = URL(string: "https://api.tvmaze.com/shows")
 
    var session : URLSession
    
    init() {session = URLSession.shared}
    
    func get(callback: @escaping (ServerResponse) -> Void){
        
        guard let url = baseURL else{return}
        
        session.dataTask(with: url) { (data, response, err) in
          
            guard let data = data else{return}
            do{
                let response = try JSONDecoder().decode([APIShowsResponseElement].self, from: data)
              //  callback(ServerResponse.error)
               callback(ServerResponse.succesfull(list: response))
            }catch{
                callback(ServerResponse.error)
            }
          
            
        }.resume()
    }
    
    
    
    
  
}

