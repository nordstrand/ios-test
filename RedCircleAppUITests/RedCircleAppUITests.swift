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

    func testRedCircleIsVisible() throws {
        let circle = app.otherElements["redCircle"]
        XCTAssertTrue(circle.waitForExistence(timeout: 5), "Red circle should be visible on screen")
    }

    func testRedCircleScreenshot() throws {
        // Wait for the circle to appear
        let circle = app.otherElements["redCircle"]
        XCTAssertTrue(circle.waitForExistence(timeout: 5), "Red circle should be visible on screen")

        // Take a full-screen screenshot and attach it to the test report
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "Red Circle Screenshot"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
