//
//  UIView.swift
//  UIViewHit
//
//  Created by Maxim Subbotin on 14.06.2022.
//

import Foundation
import UIKit

public extension UIView {
    func myHitTest(_ p: CGPoint, with event: UIEvent?) -> UIView? {
        if !point(inside: p, with: event) || shouldIgnore(view: self) {
            return nil
        }
        for subview in subviews.reversed() {
            let nextPoint = CGPoint(x: p.x - subview.frame.minX, y: p.y - subview.frame.minY)
            if let view = subview.myHitTest(nextPoint, with: event) {
                return view
            }
        }
        return self
    }
    
    private func shouldIgnore(view: UIView) -> Bool {
        return view.isHidden || !view.isUserInteractionEnabled || view.alpha < 0.01
    }
}
