import SwiftUI

struct CreateProfileView: View {
    @State private var name: String = "Alex"
    @State private var age: Double = 26
    @State private var bio: String = "Say something about yourself..."

    var onContinue: () -> Void

    var body: some View {
        ZStack {
            DCTheme.bgGradient.ignoresSafeArea()

            VStack(spacing: 20) {
                HStack {
                    Text("Create Your Profile")
                        .font(.title2).bold()
                        .foregroundColor(.white)
                    Spacer()
                }

                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        Circle()
                            .fill(DCTheme.card)
                            .frame(width: 72, height: 72)
                            .overlay(Image(systemName: "person.fill").foregroundColor(.white).font(.title2))
                        VStack(alignment: .leading) {
                            TextField("Name", text: $name)
                                .textFieldStyle(.roundedBorder)
                                .font(.headline)
                            HStack {
                                Text("Age: ")
                                    .foregroundColor(.white.opacity(0.8))
                                Text("\(Int(age))")
                                    .foregroundColor(.white)
                                    .bold()
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    .background(DCTheme.card)
                    .cornerRadius(16)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("About you")
                            .foregroundColor(.white.opacity(0.9))
                        TextEditor(text: $bio)
                            .frame(height: 100)
                            .padding(8)
                            .background(DCTheme.card)
                            .cornerRadius(12)
                    }

                    VStack(alignment: .leading) {
                        Slider(value: $age, in: 18...60, step: 1)
                            .tint(.pink)
                        HStack {
                            Text("18")
                            Spacer()
                            Text("60")
                        }
                        .foregroundColor(.white.opacity(0.6))
                        .font(.caption)
                    }
                    .padding()
                    .background(DCTheme.card)
                    .cornerRadius(16)
                }

                Spacer()

                Button(action: onContinue) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .buttonStyle(DCButtonStyle())
            }
            .padding(24)
            .foregroundColor(.white)
        }
    }
}

#Preview {
    CreateProfileView(onContinue: {})
}
