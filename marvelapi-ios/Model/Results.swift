//
//  Results.swift
//  marvelapi-ios
//
//  Created by Vinicius Pontes on 08/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation

struct Results: Decodable {
    var id: Int
    var name: String
    var description: String
    var thumbnail: Thumbnail
}
