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
        
        let animatingContainerView = CardAnimationView.initFromNib()
        
        let containerView = transitionContext.containerView
        let finalFrame = transitionContext.finalFrame(for: toVC)
        
        snapShot.frame = originFrame
        snapShot.layer.cornerRadius = 20
        snapShot.layer.masksToBounds = true
        
        animatingContainerView.frame = originFrame
        animatingContainerView.layer.cornerRadius = 20
        animatingContainerView.layer.masksToBounds = true
        
        containerView.addSubview(snapShot)
        containerView.addSubview(animatingContainerView)
        containerView.addSubview(toVC.view)
        
        toVC.view.isHidden = true
//        animatingContainerView.isHidden = true
//        snapShot.isHidden = true
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .calculationModeCubic, animations: {
            fromVC.blurEffectView.alpha = 1
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2, animations: {
                let frame = CGRect(x: 0, y: 0, width: fromVC.view.frame.width, height: fromVC.view.frame.width)
                animatingContainerView.frame = frame
                animatingContainerView.layer.cornerRadius = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2, animations: {
                snapShot.frame = finalFrame
                snapShot.layer.cornerRadius = 0
            })
            
        }) { (_) in
            snapShot.removeFromSuperview()
            animatingContainerView.removeFromSuperview()
            toVC.view.isHidden = false
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
