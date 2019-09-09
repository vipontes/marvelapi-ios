//
//  MarvelService.swift
//  marvelapi-ios
//
//  Created by Vinicius Pontes on 08/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation
import CryptoSwift

class MarvelService {
    
    func getCharacters(completion: @escaping (Data?) -> ()) {

        let publicKey = "902f6957f1e652d75e4eab23c16a66b8"
        let privateKey = "e72c4bb35037de8d8da0e9da8a7a3dfaf2eb7ec5"
        let ts = NSDate().timeIntervalSince1970.description
        
        let hash = "\(ts)\(privateKey)\(publicKey)".md5()
        
        let characterListOffset = 0
        
        let strUrl: String = "http://gateway.marvel.com/v1/public/characters?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)&offset=\(characterListOffset)&orderBy=name"
        
        let url = URL(string: strUrl)!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let res = try? JSONDecoder().decode(ResponseBody.self, from: data)
                if let res = res {
                    completion(res.data)
                }
            }
        }.resume()
    }
}
