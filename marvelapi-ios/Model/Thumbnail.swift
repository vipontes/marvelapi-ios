//
//  Thumbnail.swift
//  marvelapi-ios
//
//  Created by Vinicius Pontes on 08/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation

struct Thumbnail: Decodable {
    var path: String
    var ext: String
    
    private enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}
