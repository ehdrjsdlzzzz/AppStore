//
//  EnlargePresentAnimationController.swift
//  App Store Transitions
//
//  Created by 이동건 on 04/11/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class EnlargePresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    private let originFrame: CGRect
    
    init(_ originFrame: CGRect) {
        self.originFrame = originFrame
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? ViewController else { return }
        guard let toVC = transitionContext.viewController(forKey: .to) else { return }
        guard let snapShot = toVC.view.snapshotView(afterScreenUpdates: true) else { return }
        
        let containerView = transitionContext.containerView
        let finalFrame = transitionContext.finalFrame(for: toVC)
        
        snapShot.frame = originFrame
        snapShot.layer.cornerRadius = 20
        snapShot.layer.masksToBounds = true
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapShot)
        
        toVC.view.isHidden = true

        UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            fromVC.blurEffectView.alpha = 1
            snapShot.frame = finalFrame
            snapShot.layer.cornerRadius = 0
        }) { (_) in
            
            toVC.view.isHidden = false
            snapShot.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
