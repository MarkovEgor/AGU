//
//  CollectionViewCell.swift
//  AGU
//
//  Created by Egor Markov on 07/01/2019.
//  Copyright © 2019 Egor Markov. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageName: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageName.layer.cornerRadius = 10
        
    }
    
    func configurClothescollection(clothesCollection: Clothes) {
        imageName.image = UIImage(named: clothesCollection.imageName)
    }
}
