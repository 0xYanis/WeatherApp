//
//  WeatherAppUITestsLaunchTests.swift
//  WeatherAppUITests
//
//  Created by Yan Rybkin on 18.03.2023.
//

import XCTest
@testable import WeatherApp

final class WeatherAppUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
