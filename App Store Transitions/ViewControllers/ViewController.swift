//
//  ViewController.swift
//  App Store Transitions
//
//  Created by 이동건 on 04/11/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var titles: [String] = ["Title-1", "Title-2", "Title-3", "Title-4"]
    private var descriptions: [String] = ["Description-1", "Description-2", "Description-3", "Description-4"]
    private var cardViewFrame: CGRect!
    private var selected: IndexPath?
    
    @IBOutlet weak var blurEffectView: UIVisualEffectView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowCardDetail" else { return }
        guard let destination = segue.destination as? CardDetailViewController else { return }
        destination.dataSource = self
        destination.transitioningDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.blurEffectView.alpha = 0
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        cell.setup(title: titles[indexPath.item], description: descriptions[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CardCell else { return }
        cardViewFrame = cell.superview?.convert(cell.frame, to: self.view)
        selected = indexPath
        cell.performSegue = {
            self.performSegue(withIdentifier: "ShowCardDetail", sender: indexPath)
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width - 30
        let height = width
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return EnlargePresentAnimationController(cardViewFrame)
    }
}

extension ViewController: DataTransferDelegate {
    var cardTitle: String? {
        guard let indexPath = selected else { return nil }
        return titles[indexPath.item]
    }
    
    var cardDesc: String? {
        guard let indexPath = selected else { return nil }
        return descriptions[indexPath.item]
    }
}
