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

    func test_post_launch_table_view_state() {
        // 1. Launch the application with default options and command line arguments
        let app = XCUIApplication()
        app.launch()
        
        let tableView = app.tables.firstMatch
        
        // 2. Table view must not be on screen now
        XCTAssertTrue(tableView.exists, "Table View Must Be Present On Screen Now")
        let cells = tableView.cells
        XCTAssertTrue(cells.count == 0, "No cell should be visible before `Data Available Button` is tapped")
    }
    func test_data_available_state_config() {
        
        let app = launchAppAndTapButton(buttonText: "Data Available")
        let tableView = app.tables.firstMatch
        
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
    
    func test_no_data_state_config() {
        let app = launchAppAndTapButton(buttonText: "No Data")
        let tableView = app.tables.firstMatch
        
        // 1. Make sure table view appears on screen
        guard tableView.cells.count == 0 else {
            XCTFail("Cells must not be shown")
            return
        }
        
        // 2. Assert No Data State
        let emptyCartLabel = tableView.staticTexts["EMPTY CART"]
        let descLabel = tableView.staticTexts["Please add some item in your cart first"]
        XCTAssertTrue(emptyCartLabel.exists, "Title Label Not Found")
        XCTAssertTrue(descLabel.exists, "Description Label Not Found")
        //XCTAssertTrue(tableView.images["StackImageView"].exists, "No Cart Image Found")
    }
    func test_error_with_image_state_config() {
        let app = launchAppAndTapButton(buttonText: "Error with Image")
        let tableView = app.tables.firstMatch
        
        // 1. Make sure table view appears on screen
        guard tableView.cells.count == 0 else {
            XCTFail("Cells must not be shown")
            return
        }
        
        // 2. Assert State
        let emptyCartLabel = tableView.staticTexts["SERVER ERROR"]
        let descLabel = tableView.staticTexts["We are notified and working on it, we will be back soon"]
        XCTAssertTrue(emptyCartLabel.exists, "Title Label Not Found")
        XCTAssertTrue(descLabel.exists, "Description Label Not Found")
        //XCTAssertTrue(tableView.images["StackImageView"].exists, "Server Error Image Found")
    }
    
    func test_simple_error_with_title_state_config() {
        let app = launchAppAndTapButton(buttonText: "Error Title")
        let tableView = app.tables.firstMatch
        
        // 1. Make sure table view appears on screen
        guard tableView.cells.count == 0 else {
            XCTFail("Cells must not be shown")
            return
        }
        
        // 2. Assert State
        let emptyCartLabel = tableView.staticTexts["SIMPLE ERROR TITLE"]
        let descLabel = tableView.staticTexts["Error message goes here"]
        XCTAssertTrue(emptyCartLabel.exists, "Title Label Not Found")
        XCTAssertTrue(descLabel.exists, "Description Label Not Found")
        //XCTAssertTrue(tableView.images["StackImageView"].exists, "Server Error Image Found")
    }
    
    func test_loading_state_config() {
        let app = launchAppAndTapButton(buttonText: "Loading")
        let tableView = app.tables.firstMatch
        
        // 1. Make sure table view appears on screen
        guard tableView.cells.count == 0 else {
            XCTFail("Cells must not be shown")
            return
        }
        
        // 2. Assert State
        let descLabel = tableView.staticTexts["Loading data..."]
        XCTAssertTrue(descLabel.exists, "Description Label Not Found")
        let loader = tableView.activityIndicators.firstMatch
        XCTAssertTrue(loader.exists, "Loader must be visible on screen")
    }
    
    func test_error_with_retry_state_config() {
        let app = launchAppAndTapButton(buttonText: "Error with retry")
        let tableView = app.tables.firstMatch
        
        // 1. Make sure table view appears on screen
        guard tableView.cells.count == 0 else {
            XCTFail("Cells must not be shown")
            return
        }
        
        // 2. Assert State
        let titleLabel = tableView.staticTexts["NO INTERNET"]
        XCTAssertTrue(titleLabel.exists, "Title Label Not Found")
        let descLabel = tableView.staticTexts["You are not connected to Internet, please try later"]
        XCTAssertTrue(descLabel.exists, "Description Label Not Found")
        let tryAgainButton = tableView.buttons.firstMatch
        XCTAssertTrue(tryAgainButton.exists, "Retry button not found")
        XCTAssertEqual(tryAgainButton.label, "Try Again")
        
    }
    func test_transition_error_with_retry_to_loading_to_data_available_state() {
        let app = launchAppAndTapButton(buttonText: "Error with retry")
        let tableView = app.tables.firstMatch
        
        // 1. Make sure table view appears on screen
        guard tableView.cells.count == 0 else {
            XCTFail("Cells must not be shown")
            return
        }
        
        // 2. Tap on Retry Button
        let tryAgainButton = tableView.buttons.firstMatch
        tryAgainButton.tap()
        
        // 3. Assert state configuration for Loading Screen
        let descLabel = tableView.staticTexts["Loading data..."]
        XCTAssertTrue(descLabel.exists, "Description Label Not Found")
        let loader = tableView.activityIndicators.firstMatch
        XCTAssertTrue(loader.exists, "Loader must be visible on screen")
        
        // 4. Tap on Data Available Button for state transition
        app.buttons["Data Available"].tap()
        
        // 5. Assert data available state
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
    
    private func launchAppAndTapButton(buttonText: String) -> XCUIApplication {
        // 1. Launch the application with default options and command line arguments
        let app = XCUIApplication()
        app.launch()

        // 2. Tap on button `Data Available`
        app.buttons[buttonText].tap()
        
        return app
    }
}
