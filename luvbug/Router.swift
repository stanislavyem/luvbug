import SwiftUI
internal import Combine

enum AppRoute: Hashable {
    case home
    case explore
    case messages
    case profile
    case createProfile
    case matchFound
    case live
    case results
    case chooseDate
}

final class Router: ObservableObject {
    @Published var path: [AppRoute] = []

    func go(_ route: AppRoute) { path.append(route) }
    func back() { if !path.isEmpty { _ = path.removeLast() } }
    func reset() { path.removeAll() }
}

struct RootTabView: View {
    @StateObject private var router = Router()

    var body: some View {
        TabView {
            NavigationStack(path: $router.path) {
                HomeView()
                    .navigationDestination(for: AppRoute.self) { route in
                        switch route {
                        case .createProfile: CreateProfileView { router.go(.matchFound) }
                        case .matchFound: MatchFoundView { router.go(.live) }
                        case .live: LiveDateView { router.go(.results) }
                        case .results: ResultsView { router.go(.chooseDate) }
                        case .chooseDate: ChooseDateView { }
                        default: HomeView()
                        }
                    }
            }
            .tabItem { Label("Explore", systemImage: "safari") }

            NavigationStack {
                MessagesView()
            }
            .tabItem { Label("Messages", systemImage: "bubble.left.and.bubble.right") }

            NavigationStack {
                ProfileView()
            }
            .tabItem { Label("Profile", systemImage: "person") }
        }
        .environmentObject(router)
    }
}

struct HomeView: View {
    @EnvironmentObject private var router: Router
    var body: some View {
        VStack(spacing: 16) {
            Text("Explore")
                .font(.largeTitle).bold()
                .foregroundColor(.white)
            Button("Create Profile") { router.go(.createProfile) }
                .buttonStyle(DCButtonStyle())
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DCTheme.bgGradient.ignoresSafeArea())
    }
}

struct MessagesView: View {
    var body: some View {
        Text("Messages coming soon")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(DCTheme.bgGradient.ignoresSafeArea())
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile coming soon")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(DCTheme.bgGradient.ignoresSafeArea())
    }
}

#Preview {
    RootTabView()
}
