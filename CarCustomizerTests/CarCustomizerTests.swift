//
//  CarCustomizerTests.swift
//  CarCustomizerTests
//
//  Created by Aaron Rex on 12/01/2020.
//  Copyright © 2020 Aaron Rex. All rights reserved.
//

import XCTest
@testable import CarCustomizer

class CarCustomizerTests: XCTestCase {
    
    func testForDisplayStats() {
        let car = Car(make: "Audi", model: "Q8", topSpeed: 155, acceleration: 5.9, handling: 4 )
        
        let display = """
            Make: Audi
            Model: Q8
            Top Speed: 155
            Acceleration: 5.9
            Handling: 4
        

        """
        XCTAssertEqual(car.displayStats(), display)
        
        
                    
    }


}
