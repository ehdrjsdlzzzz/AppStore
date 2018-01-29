//
//  AppsCell.swift
//  AppStore
//
//  Created by 이동건 on 2018. 1. 29..
//  Copyright © 2018년 이동건. All rights reserved.
//

import UIKit

class AppsCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.image = #imageLiteral(resourceName: "frozen")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        nameLabel.text = "Disney Build It : Frozen"
        nameLabel.numberOfLines = 2
        
        categoryLabel.text = "Entertainment"
        categoryLabel.textColor = .darkGray
        
        priceLabel.text = "$3.99"
        priceLabel.textColor = .darkGray
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
