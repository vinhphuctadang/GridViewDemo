//
//  CollectionViewCell.swift
//  GridViewDemo
//
//  Created by Ta Dang Vinh Phuc on 10/13/20.
//  Copyright © 2020 Ta Dang Vinh Phuc. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    var id : String? = nil
    @IBOutlet weak var txtId: UILabel!
}
