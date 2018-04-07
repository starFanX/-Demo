//
//  blueView.swift
//  响应者链条测试
//
//  Created by 星 Fan on 2018/2/22.
//  Copyright © 2018年 星 Fan. All rights reserved.
//

import UIKit

class blueView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("blueHit")
        let view = super.hitTest(point, with: event)
        print(view)
        return view
    }
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        print("redPointIn")
        return super.point(inside: point, with: event)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("blueTouchBegin")
        super.touchesBegan(touches, with: event)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
