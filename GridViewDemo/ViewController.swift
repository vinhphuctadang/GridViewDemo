//
//  ViewController.swift
//  GridViewDemo
//
//  Created by Ta Dang Vinh Phuc on 10/13/20.
//  Copyright © 2020 Ta Dang Vinh Phuc. All rights reserved.
//

import UIKit

class ViewController:
    UIViewController,
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    
    // implement following protocol to define sizing rule for cells
    UICollectionViewDelegateFlowLayout {
//
    @IBOutlet weak var this: UICollectionView!
    
    // custom variables
    
    // inset is used for 'margin'
    let inset: CGFloat = 3
    
    // number of cell on a row
    let cellsPerRow = 2
    
    // space between lines
    let minimumLineSpacing: CGFloat = 3
    
    // space between elements
    let minimumInteritemSpacing: CGFloat = 3
    
    var images : [UIImage?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View loaded")
        this.contentInsetAdjustmentBehavior = .always
        
        for i in 0...4 {
            images.append(UIImage(named: "img\(i)"))
        }
    }
    
    // return count so that CollectionView can recognize number of Cell to allocate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // we return 40 item for testing
        return 40
    }
    
    // setup displays
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInteritemSpacing
    }
    
    // return computed size for cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // compute margin and insets
        let marginsAndInsets = inset * 2 + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        
        var size : CGSize
        
        // try different view size
        
        size = CGSize(width: itemWidth, height: itemWidth)
        return size
    }

    // load content into cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.image.image = self.images[indexPath.item % self.images.count]
        cell.id = "\(indexPath.item)"
        cell.txtId.text = cell.id
        
        cell.backgroundColor = UIColor.black;
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        print(cell.id)
    }
}

