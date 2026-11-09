import SwiftUI

struct ChooseDateView: View {
    var onDone: () -> Void

    var body: some View {
        ZStack {
            DCTheme.bgGradient.ignoresSafeArea()

            VStack(spacing: 20) {
                HStack {
                    Text("Choose Your Date")
                        .font(.title2).bold()
                        .foregroundColor(.white)
                    Spacer()
                }

                HStack(spacing: 16) {
                    CandidateCard(name: "Alex", age: 26)
                    CandidateCard(name: "Teddy", age: 25)
                }

                Spacer()

                Button(action: onDone) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .buttonStyle(DCButtonStyle())
            }
            .padding(24)
        }
    }
}

private struct CandidateCard: View {
    let name: String
    let age: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 16)
                .fill(DCTheme.card)
                .frame(height: 220)
                .overlay(Image(systemName: "person.fill").foregroundColor(.white).font(.largeTitle))
            Text("\(name), \(age)")
                .font(.headline)
                .foregroundColor(.white)
            HStack(spacing: 6) {
                Image(systemName: "sparkles")
                Text("Match: 92%")
            }
            .foregroundColor(.white.opacity(0.8))
            .font(.caption)
        }
        .padding(12)
        .background(DCTheme.card)
        .cornerRadius(20)
    }
}

#Preview {
    ChooseDateView(onDone: {})
}
