//
//  Extentions.swift
//  Gambit
//
//  Created by Robbie on 8/25/17.
//  Copyright © 2017 Robbie. All rights reserved.
//

import UIKit

extension Timer {
    
    // Should be implemented as associated properties instead of a static dictionary. This mechanism leaks.
    private static var stopMethods = [Timer: (timer: Timer) -> Void]()
    
    var onStop:((_ timer: Timer) -> Void)? {
        get {
            return Timer.stopMethods[self]
        }
        
        set(newValue) {
            Timer.stopMethods[self] = newValue
        }
    }
    
    func stop() {
        invalidate()
        onStop?(self)
    }
}
