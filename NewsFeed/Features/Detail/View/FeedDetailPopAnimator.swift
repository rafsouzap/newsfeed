//
//  FeedDetailPopAnimator.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 10/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation
import UIKit

final class FeedDetailPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 0.5
    var presenting = true
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from) ?? UIView()
        let toView = transitionContext.view(forKey: .to) ?? UIView()
        let detailView = presenting ? toView : fromView
        
        let initialFrame = presenting ? originFrame : detailView.frame
        let finalFrame = presenting ? detailView.frame : originFrame
        
        let xScaleFactor = presenting ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
        let yScaleFactor = presenting ? initialFrame.height / finalFrame.height : finalFrame.height / initialFrame.height
        
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
        
        let presentingCornerRadius = UIDevice.current.userInterfaceIdiom == .pad ? 10.0 : 0.0
        let cornerRadius = presenting ? CGFloat(presentingCornerRadius) : CGFloat(20.0)
        
        let alpha = presenting ? CGFloat(1.0) : CGFloat(0.0)
        
        if presenting {
            detailView.transform = scaleTransform
            detailView.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
            detailView.layer.cornerRadius = 20.0
            detailView.clipsToBounds = true
            detailView.alpha = 0.0
        }
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(detailView)
        
        let propertyAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.75) {
            detailView.transform = self.presenting ? .identity : scaleTransform
            detailView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
            detailView.layer.cornerRadius = cornerRadius
            detailView.alpha = alpha
        }
        
        propertyAnimator.addCompletion { position in
            transitionContext.completeTransition(true)
        }
        propertyAnimator.startAnimation()
    }
}

