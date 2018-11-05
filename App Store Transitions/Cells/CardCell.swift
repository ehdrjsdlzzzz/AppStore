//
//  CardCell.swift
//  App Store Transitions
//
//  Created by 이동건 on 04/11/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var performSegue: (()->Void)?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        })
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.performSegue?()
        UIView.animate(withDuration: 1, animations: {
            self.transform = .identity
        })
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.3, animations: {
            self.transform = .identity
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupImageViewCorner()
        self.isUserInteractionEnabled = true
    }
    
    private func setupImageViewCorner() {
        backgroundImageView.layer.cornerRadius = 20
        backgroundImageView.layer.masksToBounds = true
    }
    
    func setup(title: String, description: String) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
    
}
