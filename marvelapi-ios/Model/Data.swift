//
//  Data.swift
//  marvelapi-ios
//
//  Created by Vinicius Pontes on 08/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation

struct Data: Decodable {
    var offset: Int
    var limit: Int
    var total: Int
    var count: Int
    var results: [Results]
}
