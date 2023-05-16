//
//  TodoAppUITests.swift
//  TodoAppUITests
//
//  Created by Esteban SEMELLIER on 29/04/2023.
//

import XCTest

final class TodoAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testAddwithoutDate() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sleep(5)
        // Navigation to addView
        XCTAssert(app.navigationBars.element.buttons.element.exists)
        app.navigationBars.element.buttons.element.tap()
        
        // Renomage des éléments
        let addButton = app.buttons["add"]
        let titleTexfield = app.textFields["Titre"]
        let descriptionTexfield = app.textFields["Description"]
        let segmentedPicker = app.segmentedControls["categoryPicker"]
        let hourAndDateSwitch = app.switches["switcher"]
        
        // Test if elements exist
        XCTAssert(addButton.exists)
        XCTAssert(titleTexfield.exists)
        XCTAssert(descriptionTexfield.exists)
        XCTAssert(segmentedPicker.exists)
        XCTAssert(hourAndDateSwitch.exists)
        
        // Fill Textfields
        // title Texfield
        titleTexfield.tap()
        titleTexfield.typeText("Ceci est un titre sans date")
        // Description textField
        descriptionTexfield.tap()
        descriptionTexfield.typeText("Ceci est une description sans date")
        
        // Select category on category picker
        segmentedPicker.buttons["Maison"].tap()
        
        // Save
        addButton.tap()
        sleep(3)
    }
    func testAddwithDate() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sleep(5)
        // Navigation to addView
        XCTAssert(app.navigationBars.element.buttons.element.exists)
        app.navigationBars.element.buttons.element.tap()
        
        // Renomage des éléments
        let addButton = app.buttons["add"]
        let titleTexfield = app.textFields["Titre"]
        let descriptionTexfield = app.textFields["Description"]
        let segmentedPicker = app.segmentedControls["categoryPicker"]
        let hourAndDateSwitch = app.switches["switcher"]
        let dateField = app.datePickers["dateField"]
        let hourField = app.datePickers["hourField"]
        
        // Test if elements exist
        XCTAssert(addButton.exists)
        XCTAssert(titleTexfield.exists)
        XCTAssert(descriptionTexfield.exists)
        XCTAssert(segmentedPicker.exists)
        XCTAssert(hourAndDateSwitch.exists)
        
        // Fill Textfields
        // title Texfield
        titleTexfield.tap()
        titleTexfield.typeText("Ceci est un titre avec date")
        // Description textField
        descriptionTexfield.tap()
        descriptionTexfield.typeText("Ceci est une description avec date")
        
        // Select category on category picker
        segmentedPicker.buttons["Maison"].tap()
        
        // Switch the toggle
        hourAndDateSwitch.tap()
        
        // Verify if datePickers exists
        XCTAssert(dateField.exists && hourField.exists)
        
        // Save
        addButton.tap()
        sleep(5)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
