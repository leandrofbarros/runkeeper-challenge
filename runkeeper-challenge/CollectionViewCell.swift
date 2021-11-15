//
//  CollectionViewCell.swift
//  runkeeper-challenge
//
//  Created by Leandro Falbo Barros on 2021-11-13.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var medalImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func cellInit(image: UIImage, title: String, description: String, medalEnable: Bool) {
        

        self.medalImageView.image = image
        if(!medalEnable) {
            self.medalImageView.image = image.withAlpha(0.3)
        }

        self.titleLabel.text = title
        self.descriptionLabel.text = description
        
    }

}


