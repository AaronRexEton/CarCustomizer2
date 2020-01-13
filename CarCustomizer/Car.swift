//
//  Car.swift
//  CarCustomizer
//
//  Created by Aaron Rex on 12/01/2020.
//  Copyright © 2020 Aaron Rex. All rights reserved.
//

import Foundation

struct Car {
    var make: String
    var model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        return """
            Make: \(make)
            Model: \(model)
            Top Speed: \(topSpeed)
            Acceleration (0-60 in): \(acceleration)
            Handling: \(handling)
        

        """
    }
}
