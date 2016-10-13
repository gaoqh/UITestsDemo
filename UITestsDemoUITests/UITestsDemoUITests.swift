//
//  UITestsDemoUITests.swift
//  UITestsDemoUITests
//
//  Created by gaoqinghua on 16/10/10.
//  Copyright © 2016年 gaoqinghua. All rights reserved.
//

import XCTest

class UITestsDemoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        testTestView()
    }
    func testTestView() {
        
        let app = XCUIApplication()
        app.switches["1"].tap()
        app.switches["0"].tap()
        
        let calculaterElementsQuery = app.otherElements.containingType(.StaticText, identifier:"Calculater")
        let placeholderTextField = calculaterElementsQuery.childrenMatchingType(.TextField).matchingIdentifier("Placeholder").elementBoundByIndex(0)
        placeholderTextField.tap()
        placeholderTextField.typeText("12")
        
        let placeholderTextField2 = calculaterElementsQuery.childrenMatchingType(.TextField).matchingIdentifier("Placeholder").elementBoundByIndex(1)
        placeholderTextField2.tap()
        placeholderTextField2.typeText("12")
        
        let button = app.buttons["="]
        button.tap()
        
        let okButton = app.alerts["FBI Warning"].collectionViews.buttons["OK"]
        okButton.tap()
        
        placeholderTextField.tap()
        let deleteKey = app.keys["Delete"]
        deleteKey.tap()
        placeholderTextField.typeText("12")
        app.switches["1"].tap()
        placeholderTextField2.tap()
        deleteKey.tap()
        placeholderTextField2.typeText("36")
        button.tap()
        
        
        
    }
}
