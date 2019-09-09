//
//  CharacterListViewModel.swift
//  marvelapi-ios
//
//  Created by Vinicius Pontes on 08/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation

struct CharacterListViewModel {
    let characters: [Results]
}

extension CharacterListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.characters.count
    }
    
    func characterAtIndex(_ index: Int) -> CharacterViewModel {
        let character = self.characters[index]
        return CharacterViewModel(character)
    }
}

struct CharacterViewModel {
    private let character: Results
}

extension CharacterViewModel {
    init(_ character: Results) {
        self.character = character
    }
}

extension CharacterViewModel {
    var id: Int {
        return self.character.id
    }
    
    var name: String {
        return self.character.name
    }

    var description: String {
        return self.character.description
    }
    
    var imageUrl: String {
        return "\(self.character.thumbnail.path).\(self.character.thumbnail.ext)"
    }
}
