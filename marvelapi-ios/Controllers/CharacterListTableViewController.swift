//
//  CharacterListTableViewController.swift
//  marvelapi-ios
//
//  Created by Vinicius Pontes on 08/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation
import UIKit

class CharacterListTableViewController: UITableViewController {
    
     private var characterListViewModel: CharacterListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        loadData()
    }
    
    private func loadData() {
        MarvelService().getCharacters() { data in
            if let data = data {
                self.characterListViewModel = CharacterListViewModel(characters: data.results)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.characterListViewModel == nil ? 0 : self.characterListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characterListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as? CharacterCell else {
            fatalError("CharacterCell not found")
        }
        
        let characterVM = self.characterListViewModel.characterAtIndex(indexPath.row)
        
        cell.nameLabel.text = characterVM.name
        cell.characterImageView.imageFromURL(urlString: characterVM.imageUrl)

        return cell
    }
}
