//
//  MainTableView.swift
//  swiftDemo
//
//  Created by witaction on 2017/6/12.
//  Copyright © 2017年 witaction. All rights reserved.
//

import UIKit

class MainTableView: UITableView {
    
    @objc var responsView:UIView?
    
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        let pointt = responsView?.convert(point, from: self)
        
        if (responsView?.point(inside: pointt!, with: event))! {
            return responsView
        }

        return super.hitTest(point, with: event)
    }

}
