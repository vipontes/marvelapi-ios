//
//  DetailViewController.swift
//  marvelapi-ios
//
//  Created by Vinicius Pontes on 09/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate {

    var characterViewModel: CharacterViewModel?
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 237/255, green: 66/255, blue: 38/255, alpha: 1.0)
        self.modalPresentationStyle = .custom
        self.navigationController?.delegate = self
        
        setupVMBindings()
    }
    
    override func viewDidLayoutSubviews() {
        descriptionLabel.sizeToFit()
    }
    
    func setupVMBindings() {
        if let characterVM = self.characterViewModel {
            self.characterImageView.imageFromURL(urlString: characterVM.imageUrl)
            self.nameLabel.text = characterVM.name
            self.descriptionLabel.text = characterVM.description
        }
    }
    
    @IBAction func onCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController: UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 3.0, animationType: .present)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 3.0, animationType: .dismiss)
    }
}
