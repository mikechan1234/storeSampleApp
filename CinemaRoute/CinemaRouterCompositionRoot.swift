import SwiftUI

@Observable
class CinemaRouterCompositionRoot {
    private var cinemaStore = CinemaStore(cinemaFetcher: CinemaRepository(decoder: JSONDecoder())) 
    private var filmStore = FilmStore(filmFetcher: FilmRepository())
    
    var router = Router<CinemaRoute>()
    
    func buildRoot() -> some View {
        CinemaList()
            .environment(\.cinemaStore, cinemaStore)
//            .environment(router)
            .environmentObject(router)
            .navigationDestination(for: CinemaRoute.self) {[weak self] value in
                self?.build(route: value)
            }
    }
    
    @ViewBuilder
    func build(route: CinemaRoute) -> some View {
        switch route {
        case .details(let cinema): 
            CinemaDetailView(cinema: cinema)
                .environment(\.filmStore, filmStore)
                .environmentObject(router)
//                .environment(router)
        case .booking(let film):
            FilmBookingView(film: film)
                .environment(BookingSession(film: film))
        case .text(let string):
            Text(string)
        }
    }
}
