//
//  BounceAnimationController.swift
//  StoreSearch
//
//  Created by Le Van Binh on 1/16/17.
//  Copyright © 2017 Le Van Binh. All rights reserved.
//

import UIKit

class BounceAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }
        let containerView = transitionContext.containerView
        
        toView.frame = transitionContext.finalFrame(for: toViewController)
        containerView.addSubview(toView)
        toView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        
        UIView.animateKeyframes(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .calculationModeCubic, animations: { 
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.334, animations: { 
                toView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.334, relativeDuration: 0.333, animations: {
                toView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.666, relativeDuration: 0.333, animations: {
                toView.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }) { (finished) in
            transitionContext.completeTransition(finished)
        }
    }
}
