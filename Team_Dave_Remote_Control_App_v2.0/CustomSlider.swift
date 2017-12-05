//
//  CustomSlider.swift
//  Team_Dave_Remote_Control_App_v2.0
//
//  Created by Team Dave on 12/4/17.
//  Copyright © 2017 Shang-Yun Wu. All rights reserved.
//

import UIKit

class CustomSlider: UISlider {

    private var thumbTouchSize = CGSize(width: 10, height: 0);
    let min_track = UIImage(named: "min_track.png");
    let max_track = UIImage(named: "max_track.png");
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // set custom images
        self.setMinimumTrackImage(min_track, for: .normal);
        self.setMaximumTrackImage(max_track, for: .normal);
        
        self.isContinuous = false
        self.frame = CGRect(x: -95, y: 350,
                            width: 500, height: 125)
        // make slider vertical
        self.transform = CGAffineTransform(rotationAngle: -(CGFloat(Double.pi/2)));
        self.minimumValue = 0;
        self.maximumValue = 20;
    }
    
    // Increase Thumb hot spot clickable area
    // points outside of the control appear to be inside control
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var bounds: CGRect = self.bounds
        bounds = bounds.insetBy(dx: -thumbTouchSize.width, dy: 0);
        return bounds.contains(point);
    }
    
    // determines whether the user has clicked on thumb control (to start tracking)
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let thumbPercent = (value - minimumValue) / (maximumValue - minimumValue)
        let thumbSize = thumbRect(forBounds: bounds, trackRect:trackRect(forBounds: bounds), value:0).size.height
        let thumbPos = CGFloat(thumbSize) + (CGFloat(thumbPercent) * (CGFloat(bounds.size.width) - (2 * CGFloat(thumbSize))))
        let touchPoint = touch.location(in: self)
        
        return (touchPoint.x >= (thumbPos - thumbTouchSize.width) &&
            touchPoint.x <= (thumbPos + thumbTouchSize.width))
    }
    
}
