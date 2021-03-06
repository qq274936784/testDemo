//
//  UIView+Position.swift
//  MU
//
//  Created by heyuze on 16/7/14.
//  Copyright © 2016年 HYZ. All rights reserved.
//

import UIKit

extension UIView {
    
    @objc public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    }
    
    @objc public var y: CGFloat {
        get{
            return self.frame.origin.y
        }
        set {
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    }
    
    // 右边界的x值
    @objc public var rightX: CGFloat {
        get {
            return self.x + self.width
        }
        set {
            var r = self.frame
            r.origin.x = newValue - frame.size.width
            self.frame = r
        }
    }
    
    // 下边界的y值
    @objc public var bottomY: CGFloat {
        get {
            return self.y + self.height
        }
        set {
            var r = self.frame
            r.origin.y = newValue - frame.size.height
            self.frame = r
        }
    }
    
    @objc public var centerX : CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    @objc public var centerY : CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    @objc public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var r = self.frame
            r.size.width = newValue
            self.frame = r
        }
    }
    
    @objc public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var r = self.frame
            r.size.height = newValue
            self.frame = r
        }
    }
    
    
    @objc public var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.x = newValue.x
            self.y = newValue.y
        }
    }
    
    @objc public var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.width = newValue.width
            self.height = newValue.height
        }
    }
    
}
