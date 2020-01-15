//
//  CarCustomizerUITests.swift
//  CarCustomizerUITests
//
//  Created by Aaron Rex on 12/01/2020.
//  Copyright © 2020 Aaron Rex. All rights reserved.
//

import XCTest

class CarCustomizerUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenBoughtUltraSpeedPackageTurboBoostPackageIsDisabled() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        //act
        app.switches["UltraSpeedSwitch"].tap()
        app.switches["TurboBoostSwitch"].tap()
        
        //assert
        XCTAssertEqual(app.switches["UltraSpeedSwitch"].isEnabled, true)
        XCTAssertEqual(app.switches["TurboBoostSwitch"].isEnabled, false)
        

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testWhenBoughtTurboBoostPackageUltraBoostPackageIsDisabled() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        //act
        app.switches["TurboBoostSwitch"].tap()
        app.switches["UltraSpeedSwitch"].tap()
        
        
        //assert
        XCTAssertEqual(app.switches["TurboBoostSwitch"].isEnabled, true)
        XCTAssertEqual(app.switches["UltraSpeedSwitch"].isEnabled, false)
    
    
        
        

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testForNextCarButtonWorkingReseValues() {
            let app = XCUIApplication()
            app.launch()
            
            //act
            app.switches["EngineAndExhaustSwitch"].tap()
            app.switches["TiresSwitch"].tap()
            app.switches["TurboBoostSwitch"].tap()
            app.buttons["NextCar"].tap()
            
            //assert
            
            XCTAssertEqual(app.switches["EngineAndExhaustSwitch"].isEnabled, false)
            XCTAssertEqual(app.switches["TiresSwitch"].isEnabled, false)
            XCTAssertEqual(app.switches["TurboBoostSwitch"].isEnabled, false)
            XCTAssertEqual(app.switches["UltraSpeedSwitch"].isEnabled, false)
        XCTAssertEqual(app.staticTexts["remainingFunds"].label, "Remaining Funds: 2000")
        
        
            
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
                
    
    
            }
        }
    }
}
