//
//  HoneycombDetectingView.swift
//  HoneycombViewExample
//
//  Created by suzuki_keishi on 2015/10/01.
//  Copyright © 2015 suzuki_keishi. All rights reserved.
//

import UIKit

@objc protocol HoneycombDetectingViewDelegate {
    func handleSingleTap(view:UIView, touch: UITouch)
    func handleDoubleTap(view:UIView, touch: UITouch)
}


class HoneycombDetectingView:UIView{
    
    weak var delegate:HoneycombDetectingViewDelegate?
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        
        let touch = touches.first!
        switch touch.tapCount {
        case 1 : handleSingleTap(touch)
        case 2 : handleDoubleTap(touch)
        default: break
        }
        nextResponder()
    }
    
    func handleSingleTap(touch: UITouch) {
        delegate?.handleSingleTap(self, touch: touch)
    }
    func handleDoubleTap(touch: UITouch) {
        delegate?.handleDoubleTap(self, touch: touch)
    }
}
