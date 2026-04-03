import SwiftUI

struct ContentView: View {
    @State private var bouncing = false

    var body: some View {
        Circle()
            .fill(.green)
            .frame(width: 200, height: 200)
            .offset(y: bouncing ? -100 : 0)
            .animation(
                .easeInOut(duration: 0.5).repeatCount(3, autoreverses: true),
                value: bouncing
            )
            .accessibilityIdentifier("circle")
            .onAppear { bouncing = true }
    }
}
