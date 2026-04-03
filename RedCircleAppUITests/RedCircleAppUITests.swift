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

    func testCircleBounceFrames() throws {
        let circle = app.otherElements["circle"]
        XCTAssertTrue(circle.waitForExistence(timeout: 5), "Circle should be visible")

        // Capture 9 frames over ~3.6s to cover the full bounce animation
        for i in 0..<9 {
            Thread.sleep(forTimeInterval: 0.4)
            let screenshot = XCUIScreen.main.screenshot()
            let attachment = XCTAttachment(screenshot: screenshot)
            attachment.name = "bounce_frame_\(i)"
            attachment.lifetime = .keepAlways
            add(attachment)
        }
    }
}
