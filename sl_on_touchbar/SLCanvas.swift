//
//  SLCanvas.swift
//  sl_on_touchbar
//
//  Created by NeoCat on 2016/11/09.
//  Copyright © 2016 NeoCat. All rights reserved.
//

import Cocoa

class SLCanvas: NSImageView {
    var x : CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()

        x = self.superview!.bounds.width
        
        self.animates = true
        let env = ProcessInfo.processInfo.environment
        if let value = env["SL_IMAGE"] as String? {
            self.image = NSImage(contentsOfFile: value) ?? NSImage(named: "sl.gif")!
        } else {
            self.image = NSImage(named: "sl.gif")!
        }
        let timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: updatePosition)
        timer.fire()
    }
    
    func updatePosition(timer : Timer) {
        x -= 5
        self.frame = CGRect(x: x, y: 0, width: self.image!.size.width/2, height: self.image!.size.height/2)
        if (x < -self.image!.size.width/2) {
            NSApplication.shared().terminate(self)
        } else {
            NSApplication.shared().activate(ignoringOtherApps: true)
        }
    }
}
