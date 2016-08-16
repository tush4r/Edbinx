//
//  ArticlesCollectionViewCell.swift
//  EdBinx
//
//  Created by Tushar Sharma on 11/08/16.
//  Copyright © 2016 edbinx. All rights reserved.
//

import UIKit

class ArticlesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleCategory: UILabel!
    @IBOutlet weak var authorName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
