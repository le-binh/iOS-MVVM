//
//  SlideOutAnimationController.swift
//  StoreSearch
//
//  Created by Le Van Binh on 1/16/17.
//  Copyright © 2017 Le Van Binh. All rights reserved.
//

import UIKit

class SlideOutAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        let containerView = transitionContext.containerView
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: { 
            fromView.center.y -= containerView.bounds.size.height
            fromView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) { (finished) in
            transitionContext.completeTransition(finished)
        }
    }
}
