import SwiftUI

struct DCTheme {
    // Brand colors (approximations; replace with Asset Catalog colors as needed)
    static let purple = Color(red: 68/255, green: 34/255, blue: 153/255)
    static let pink = Color(red: 1.0, green: 92/255, blue: 152/255)
    static let magenta = Color(red: 0.95, green: 0.3, blue: 0.65)
    static let dark = Color(red: 16/255, green: 13/255, blue: 30/255)
    static let card = Color(red: 31/255, green: 24/255, blue: 63/255)

    static let bgGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, DCTheme.dark, DCTheme.purple]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let accentGradient = LinearGradient(
        gradient: Gradient(colors: [DCTheme.magenta, DCTheme.pink]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct DCButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(DCTheme.accentGradient)
            .cornerRadius(16)
            .opacity(configuration.isPressed ? 0.85 : 1)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
}

struct DCSecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(DCTheme.card)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white.opacity(0.15), lineWidth: 1)
            )
            .opacity(configuration.isPressed ? 0.85 : 1)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
}
