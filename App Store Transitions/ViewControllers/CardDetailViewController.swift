//
//  CardDetailViewController.swift
//  App Store Transitions
//
//  Created by 이동건 on 04/11/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

protocol DataTransferDelegate: class {
    var cardTitle: String? { get }
    var cardDesc: String? { get }
}

class CardDetailViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var dataSource: DataTransferDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        titleLabel.text = dataSource?.cardTitle
        descriptionLabel.text = dataSource?.cardDesc
    }
    
    @IBAction func handleDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
