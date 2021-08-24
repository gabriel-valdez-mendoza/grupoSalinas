//
//  BancaDigitalUITests.swift
//  BancaDigitalUITests
//
//  Created by Jorge Parra on 19/08/21.
//

import XCTest

class BancaDigitalUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

      try super.setUpWithError()

      // In UI tests it is usually best to stop immediately when a failure occurs.
      continueAfterFailure = false

      app = XCUIApplication()
      app.launch()

      // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        try super.tearDownWithError()
    }
    

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testTabBarGraphsButton_CountNumberOfButtons() {
      let tabBar = XCUIApplication().tabBars["Tab Bar"]
      XCTAssertEqual(tabBar.buttons.count, 2, "Expected to have 2tabbar items")

    }
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
