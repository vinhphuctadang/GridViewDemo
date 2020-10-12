//
//  ViewController.swift
//  GridViewDemo
//
//  Created by Ta Dang Vinh Phuc on 10/13/20.
//  Copyright © 2020 Ta Dang Vinh Phuc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let items = ["Cell", "class", "is", "intended", "to", "be", "subclassed.", "Most", "methods", "defined", "by", "this", "class", "have", "minimal", "or", "no", "implementations.", "You", "are", "not", "required", "to", "override", "any", "of", "the", "methods", "but", "can", "do", "so", "in", "cases", "where", "you", "want", "to", "respond", "to", "changes", "in", "the", "view", "usage", "or", "layout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View loaded")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Do get cells")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.txtView.text = self.items[indexPath.item]
        return cell
    }
}

