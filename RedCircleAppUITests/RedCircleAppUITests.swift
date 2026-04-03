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

    func testCircleBounceVideo() throws {
        let circle = app.otherElements["circle"]
        XCTAssertTrue(circle.waitForExistence(timeout: 5), "Circle should be visible")

        // Wait for the full bounce animation (3 bounces × 0.5s × 2 = 3s)
        // CI records the simulator screen externally via xcrun simctl io recordVideo
        Thread.sleep(forTimeInterval: 3.5)
    }
}
