import SwiftUI

struct MatchFoundView: View {
    var matchName: String = "Alex"
    var matchAge: Int = 26
    var onStartLive: () -> Void

    var body: some View {
        ZStack {
            DCTheme.bgGradient.ignoresSafeArea()

            VStack(spacing: 20) {
                HStack {
                    Text("AI Match")
                        .font(.title2).bold()
                        .foregroundColor(.white)
                    Spacer()
                }

                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(DCTheme.card)
                            .frame(width: 120, height: 160)
                            .overlay(Image(systemName: "person.fill").foregroundColor(.white).font(.largeTitle))

                        VStack(alignment: .leading, spacing: 8) {
                            Text("We found a great match for you!")
                                .foregroundColor(.white)
                                .font(.headline)
                            Text("\(matchName), \(matchAge)")
                                .font(.title2).bold()
                                .foregroundColor(.white)
                            Text("You share interests in music, travel, and coffee dates.")
                                .foregroundColor(.white.opacity(0.8))
                                .font(.subheadline)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(DCTheme.card)
                    .cornerRadius(20)

                    Button(action: onStartLive) {
                        Text("Start 3-Minute Live Date")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    .buttonStyle(DCButtonStyle())
                }

                Spacer()
            }
            .padding(24)
        }
    }
}

#Preview {
    MatchFoundView(onStartLive: {})
}
