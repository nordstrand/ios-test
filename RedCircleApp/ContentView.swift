import SwiftUI

// Displays a red circle centered on screen
struct ContentView: View {
    var body: some View {
        Circle()
            .fill(.red)
            .frame(width: 200, height: 200)
            .accessibilityIdentifier("redCircle")
    }
}
// ci test
// debug Tue Mar 31 19:30:12 UTC 2026
