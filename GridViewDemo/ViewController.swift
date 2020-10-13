//
//  ViewController.swift
//  GridViewDemo
//
//  Created by Ta Dang Vinh Phuc on 10/13/20.
//  Copyright © 2020 Ta Dang Vinh Phuc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
//
    @IBOutlet weak var this: UICollectionView!
    let columnLayout = CustomCollectionViewFlowLayout(
        
        // number of column per row
       cellsPerRow: 3,
       
       // space between item in row
       minimumInteritemSpacing: 0,
       
       // space between row
       minimumLineSpacing: 0,
       
       // margin
       sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
   )

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View loaded")
        
        // setup UI
        
        // apply columnLayout for this
        this?.collectionViewLayout = columnLayout
    }
    
    // return count so that CollectionView can recognize number of Cell to allocate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Do get cells")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        // load content into cell
        cell.image.image = UIImage(named: "noImage")
        cell.id = "\(indexPath.item)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
        print(cell.id)
    }
}

