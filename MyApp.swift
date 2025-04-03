import SwiftUI

@main
struct MyApp: App {
    @State var cinemaRouterCompositionRoot = CinemaRouterCompositionRoot()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $cinemaRouterCompositionRoot.router.route) {
                cinemaRouterCompositionRoot.buildRoot()
            }
        }
    }
}
