import XCTest

final class RedCircleAppUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testCircleIsVisible() throws {
        let circle = app.otherElements["circle"]
        XCTAssertTrue(circle.waitForExistence(timeout: 5), "Circle should be visible")
    }

    func testCircleScreenshot() throws {
        let circle = app.otherElements["circle"]
        XCTAssertTrue(circle.waitForExistence(timeout: 5), "Circle should be visible")

        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "Circle Screenshot"
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    func testCircleBounceAnimation() throws {
        let circle = app.otherElements["circle"]
        XCTAssertTrue(circle.waitForExistence(timeout: 5), "Circle should be visible")

        // Verify the circle is still present after the full 3-second bounce animation
        Thread.sleep(forTimeInterval: 3.5)
        XCTAssertTrue(circle.exists, "Circle should still exist after animation completes")
    }
}
