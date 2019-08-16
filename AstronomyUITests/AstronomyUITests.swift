//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Dongwoo Pae on 8/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//


import XCTest

class AstronomyUITests: XCTestCase {

    var app: XCUIApplication {
        return XCUIApplication()
    }

    override func setUp() {

        let app = XCUIApplication()
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]   //once this gets called Sol will go to Sol 15
        app.launch()
    }

    //helper


    private func buttonFor(_ nextorprevious: String) -> XCUIElement {
        let input = nextorprevious.capitalized
        return app.buttons["PhotosCollectionViewController.\(input)SolButton"]
    }


    private var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }

    private var cameraFullName: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.CameraLabel"]
    }

    private func backButton() -> XCUIElement {
        return app.navigationBars.buttons["Sol 15"]
    }
    
    //you can use this with XCTAssertEqual??
    /*
    private var title: XCUIElement {
        return app.navigationBars["Title"]
    }
    */
    
    func testViewingNextSol() {

        let buttonNext = buttonFor("next")
        buttonNext.tap()

        XCTAssert(app.navigationBars["Sol 16"].exists)
        //XCTAssertEqual(title.label, "Sol 16")
    }


    func testViewingPreviousSol() {
        let buttonPrevious = buttonFor("previous")
        buttonPrevious.tap()

        XCTAssert(app.navigationBars["Sol 14"].exists)
    }


    func testSavingAPhoto() {

        let buttonNext = buttonFor("next")
        buttonNext.tap()
        let firstCell = app.collectionViews.children(matching: .any).element(boundBy: 0)
        if firstCell.exists {
            firstCell.tap()
        }
        saveButton.tap()
        XCTAssert(app.alerts["Photo Saved!"].exists)
    }

    //loadImage
    func testLoadImage() {
        let firstCell = app.collectionViews.children(matching: .any).element(boundBy: 0)
        if firstCell.exists {
            firstCell.tap()
        }
        XCTAssert(app.images["PhotoDetailViewController.ImageView"].exists)
    }
    
    //checkingiflabelShowsCorrectly
    func testCameraFullName() {
        let buttonPrevious = buttonFor("previous")  //this will take to Sol 14
        buttonPrevious.tap()
        let firstCell = app.collectionViews.children(matching: .any).element(boundBy: 0)
        if firstCell.exists {
            firstCell.tap()
        }
        XCTAssertEqual(cameraFullName.label, "Front Hazard Avoidance Camera")
    }
    
    //checkClickable
    func testButtonHittable() {
        //saveButton
        app.collectionViews.children(matching: .any).element(boundBy: 0).tap()
        XCTAssert(saveButton.isHittable)
        //backButton to PhotoCollectionViewController
        let backButton = self.backButton()
        XCTAssert(backButton.isHittable)
        
    }
}

