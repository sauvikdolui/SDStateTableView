//
//  SDStateTableView_ExampleUITests.swift
//  SDStateTableView_ExampleUITests
//
//  Created by Sauvik Dolui on 31/05/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import SDStateTableView_Example

class SDStateTableView_ExampleUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func test_data_available_state_config(){
        
        // 1. Launch the application with default options and command line arguments
        let app = XCUIApplication()
        app.launch()
        
        let tableView = app.tables.firstMatch
        
        // 2. Table view must not be on screen now
        XCTAssertTrue(tableView.exists, "Table View Must Be Present On Screen Now")
        let cells = tableView.cells
        XCTAssertTrue(cells.count == 0, "No cell should be visible before `Data Available Button` is tapped")
        
        // 3. Tap on button `Data Available`
        app.buttons["Data Available"].tap()
        
        // 4. Make sure table view appears on screen
        guard tableView.cells.count > 0 else {
            XCTFail("Cells on table view not found")
            return
        }
        
        // Iterate through the cells to validate static texts
        for i in 0..<tableView.cells.count {
            let cell = tableView.cells.element(boundBy: i)
            XCTAssertTrue(cell.exists, "Cell must be there")
            let textLabel = cell.staticTexts["Row number \(i)"]
            XCTAssertTrue(textLabel.exists, "Static Text Label Must Exists")
        }
        // Checking scrollability
        tableView.swipeUp()
        tableView.swipeDown()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
