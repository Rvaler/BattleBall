//
//  PhysicsBody.swift
//  BattleBall
//
//  Created by Rafael Valer on 4/28/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import Foundation

class PhysicsBody: NSObject {
    
    struct PhysicsCategory {
        static let None      : UInt32 = 0
        static let All       : UInt32 = UInt32.max
        static let BallCategoryBitMask   : UInt32 = 0b1       // 1
        static let FieldCategoryBitMask: UInt32 = 0b10      // 2
    }
    
}