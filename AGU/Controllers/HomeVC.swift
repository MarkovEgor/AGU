//
//  HomeVC.swift
//  AGU
//
//  Created by Egor Markov on 07/01/2019.
//  Copyright © 2019 Egor Markov. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectioView: UICollectionView!


    let clothesCollection = [
        Clothes(imageName: "1"),
        Clothes(imageName: "2"),
        Clothes(imageName: "3"),
        Clothes(imageName: "4"),
        Clothes(imageName: "5"),
        Clothes(imageName: "6"),
        Clothes(imageName: "7"),
        Clothes(imageName: "8"),
        Clothes(imageName: "9"),
        Clothes(imageName: "10"),
        Clothes(imageName: "11"),
        Clothes(imageName: "12"),
        Clothes(imageName: "13"),
        Clothes(imageName: "14"),
        Clothes(imageName: "15"),
        Clothes(imageName: "16")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectioView.delegate = self
        collectioView.dataSource = self
    }
    
    
    @IBAction func loginOutPressedButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clothesCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let clothesCell = collectioView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionViewCell {
            
            let clothesItem = clothesCollection[indexPath.item]
            clothesCell.configurClothescollection(clothesCollection: clothesItem)
            return clothesCell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.bounds.width
        let cellDimension = (width / 2) - 15
        
        return CGSize(width: cellDimension, height: cellDimension)
    }
    

    
   
    
    
    
}
