//
//  NSView.swift
//  quickswitcher
//
//  Created by Björn Friedrichs on 30/04/2019.
//  Copyright © 2019 Björn Friedrichs. All rights reserved.
//

import Cocoa

class Shadow: NSObject {
    var opacity: Float
    var color: CGColor
    var offset: CGSize
    var radius: CGFloat

    init(_ opacity: Float = 1.0, _ color: CGColor = .black, _ offset: CGSize = NSMakeSize(0, 0), _ radius: CGFloat = 5.0) {
        self.opacity = opacity
        self.color = color
        self.offset = offset
        self.radius = radius
    }
}

extension NSView {
    func addShadow(opacity: Float, color: CGColor, offset: CGSize, radius: CGFloat) {
        self.addShadow(Shadow(opacity, color, offset, radius))
    }
    
    func addShadow(_ shadow: Shadow) {
        guard let superview = self.superview else {
            print("To add shadow needs to be attached to a superview first")
            return
        }

        self.shadow = NSShadow()
        self.wantsLayer = true
        superview.wantsLayer = true

        self.layer?.shadowOpacity = shadow.opacity
        self.layer?.shadowColor = shadow.color
        self.layer?.shadowOffset = shadow.offset
        self.layer?.shadowRadius = shadow.radius
    }
}
