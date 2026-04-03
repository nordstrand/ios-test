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

        // Record the 3-second bounce animation
        let recorder = XCUIScreen.main.recordVideo()
        Thread.sleep(forTimeInterval: 3.5)

        let done = expectation(description: "recording-stopped")
        recorder.stop { attachment in
            attachment.name = "Circle Bounce"
            attachment.lifetime = .keepAlways
            self.add(attachment)
            done.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
}
