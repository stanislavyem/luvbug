import SwiftUI

struct GetStartedView: View {
    var onGetStarted: () -> Void

    var body: some View {
        ZStack {
            DCTheme.bgGradient.ignoresSafeArea()

            VStack(spacing: 24) {
                Spacer()

                VStack(spacing: 12) {
                    Image(systemName: "heart.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 96, height: 96)
                        .foregroundStyle(DCTheme.accentGradient)
                        .shadow(color: .pink.opacity(0.4), radius: 20, x: 0, y: 10)

                    Text("DateCast")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    Text("3 minutes, live.\nReal chemistry. And a funded date.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: 17, weight: .medium))
                }

                Spacer()

                Button(action: onGetStarted) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(DCTheme.accentGradient)
                        .cornerRadius(12)
                        .shadow(color: .pink.opacity(0.4), radius: 10, x: 0, y: 5)
                }
            }
            .padding(24)
        }
    }
}

#Preview {
    GetStartedView(onGetStarted: {})
}
