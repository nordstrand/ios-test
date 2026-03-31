import SwiftUI

struct ContentView: View {
    var body: some View {
        Circle()
            .fill(.red)
            .frame(width: 200, height: 200)
            .accessibilityIdentifier("redCircle")
    }
}
