import SwiftUI

struct ResultsView: View {
    var onChooseDate: () -> Void

    var body: some View {
        ZStack {
            DCTheme.bgGradient.ignoresSafeArea()

            VStack(spacing: 20) {
                Text("The 3-Minute Date Is Over!")
                    .font(.title2).bold()
                    .foregroundColor(.white)
                Text("Would you go on a date?")
                    .foregroundColor(.white.opacity(0.9))

                HStack(spacing: 12) {
                    Button(action: {}) { Text("No") }.buttonStyle(DCSecondaryButtonStyle())
                    Button(action: {}) { Text("Maybe") }.buttonStyle(DCSecondaryButtonStyle())
                    Button(action: onChooseDate) { Text("Yes!") }.buttonStyle(DCButtonStyle())
                }

                VStack(spacing: 8) {
                    Text("Date Funded: $129 raised")
                        .foregroundColor(.white)
                        .font(.headline)
                    Text("Thanks to your supporters!")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.subheadline)
                }

                Spacer()
            }
            .padding(24)
        }
    }
}

#Preview {
    ResultsView(onChooseDate: {})
}
