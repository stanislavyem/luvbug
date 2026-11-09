import SwiftUI

struct LiveDateView: View {
    @State private var message: String = ""
    var onEnd: () -> Void

    var body: some View {
        ZStack {
            DCTheme.bgGradient.ignoresSafeArea()

            VStack(spacing: 16) {
                HStack {
                    Label("3:00", systemImage: "timer")
                        .foregroundColor(.white)
                    Spacer()
                    HStack(spacing: 12) {
                        Label("1.2k", systemImage: "eye")
                        Label("1430", systemImage: "heart.fill")
                    }
                    .foregroundColor(.white.opacity(0.9))
                }

                HStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(DCTheme.card)
                        .overlay(
                            Image(systemName: "person.fill")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        )
                    RoundedRectangle(cornerRadius: 16)
                        .fill(DCTheme.card)
                        .overlay(
                            Image(systemName: "person.fill")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        )
                }
                .frame(height: 280)

                HStack(spacing: 12) {
                    Button(action: {}) { Text("$10").font(.headline) }.buttonStyle(DCSecondaryButtonStyle())
                    Button(action: {}) { Text("$50").font(.headline) }.buttonStyle(DCSecondaryButtonStyle())
                    Button(action: {}) { Text("$100").font(.headline) }.buttonStyle(DCSecondaryButtonStyle())
                }

                HStack {
                    TextField("Say something...", text: $message)
                        .textFieldStyle(.roundedBorder)
                    Button(action: { message = "" }) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(DCSecondaryButtonStyle())
                    .frame(width: 56)
                }

                Button(action: onEnd) {
                    Text("End Live Date")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .buttonStyle(DCButtonStyle())
            }
            .padding(16)
        }
    }
}

#Preview {
    LiveDateView(onEnd: {})
}
