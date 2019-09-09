//
//  CharacterCell.swift
//  marvelapi-ios
//
//  Created by Vinicius Pontes on 08/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation
import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.layer.masksToBounds = false
            characterImageView.layer.borderColor = UIColor.white.cgColor
            characterImageView.layer.cornerRadius = characterImageView.frame.size.width / 2
            characterImageView.clipsToBounds = true
            characterImageView.contentMode = UIView.ContentMode.scaleAspectFill
            
//            characterImageView.layer.borderColor = UIColor.red.cgColor
//            characterImageView.layer.borderWidth = 3

//            characterImageView.layer.shadowColor = UIColor.black.cgColor
//            characterImageView.layer.shadowOpacity = 1
//            characterImageView.layer.shadowOffset = CGSize.zero
//            characterImageView.layer.shadowRadius = characterImageView.frame.size.width / 2 + 5
//            characterImageView.layer.shadowPath = UIBezierPath(roundedRect: characterImageView.bounds, cornerRadius: characterImageView.frame.size.width / 2 + 5).cgPath

        }
    }
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 8.0
            containerView.layer.shadowColor = UIColor.gray.cgColor
            containerView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            containerView.layer.shadowRadius = 10.0
            containerView.layer.shadowOpacity = 0.9
            containerView.layer.backgroundColor = UIColor.white.cgColor
        }
    }
    
    var minHeight: CGFloat?
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        let size = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
        guard let minHeight = minHeight else { return size }
        return CGSize(width: size.width, height: max(size.height, minHeight))
    }
    
}
