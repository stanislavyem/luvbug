import SwiftUI

struct OnboardingView: View {
    @State private var page: Int = 0
    var onFinished: () -> Void

    private let totalPages = 6

    var body: some View {
        ZStack {
            DCTheme.bgGradient.ignoresSafeArea()

            VStack(spacing: 20) {
                TabView(selection: $page) {
                    OnboardingPage(
                        title: "Welcome to LuvBug",
                        subtitle: "A little live...\nA lot of possibility.",
                        imageSystemName: "heart.circle.fill"
                    ).tag(0)

                    OnboardingPage(
                        title: "How LuvBug works",
                        subtitle: "From first hello to a real date.",
                        imageSystemName: "sparkles"
                    ).tag(1)

                    OnboardingPage(
                        title: "Create your account",
                        subtitle: "Make it official.",
                        imageSystemName: "person.crop.circle.fill"
                    ).tag(2)

                    OnboardingPage(
                        title: "Start with the basics",
                        subtitle: "Add photos, name, and age.",
                        imageSystemName: "camera.viewfinder"
                    ).tag(3)

                    OnboardingPage(
                        title: "Who’s your type?",
                        subtitle: "Set preferences and interests.",
                        imageSystemName: "slider.horizontal.3"
                    ).tag(4)

                    OnboardingPage(
                        title: "Before you go live",
                        subtitle: "3:00 live speed date. Have fun!",
                        imageSystemName: "timer"
                    ).tag(5)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(maxHeight: .infinity)

                HStack(spacing: 8) {
                    ForEach(0..<totalPages, id: \.self) { i in
                        Circle()
                            .fill(i == page ? Color.white : Color.white.opacity(0.3))
                            .frame(width: i == page ? 10 : 8, height: i == page ? 10 : 8)
                            .animation(.easeInOut(duration: 0.2), value: page)
                    }
                }

                VStack(spacing: 12) {
                    Button(action: {
                        if page < totalPages - 1 { page += 1 } else { onFinished() }
                    }) {
                        Text(page < totalPages - 1 ? "Get started" : "Finish")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .buttonStyle(DCButtonStyle())

                    Button(action: { onFinished() }) {
                        Text("I already have an account")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .opacity(0.95)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .buttonStyle(DCSecondaryButtonStyle())
                }
            }
            .padding(24)
        }
    }
}

private struct OnboardingPage: View {
    let title: String
    let subtitle: String
    let imageSystemName: String

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: imageSystemName)
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 140)
                .foregroundStyle(DCTheme.accentGradient)
                .shadow(color: .pink.opacity(0.4), radius: 20, x: 0, y: 10)

            VStack(spacing: 8) {
                Text(title)
                    .font(.title2).bold()
                    .foregroundColor(.white)
                Text(subtitle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white.opacity(0.85))
            }
            Spacer()
        }
        .padding(16)
    }
}

#Preview {
    OnboardingView(onFinished: {})
}
