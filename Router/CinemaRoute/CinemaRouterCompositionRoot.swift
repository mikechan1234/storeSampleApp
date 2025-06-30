import SwiftUI

@Observable
class CinemaRouterCompositionRoot {
    private var cinemaStore = CinemaStore(cinemaFetcher: CinemaRepository(decoder: JSONDecoder())) 
    private var filmStore = FilmStore(filmFetcher: FilmRepository())
    private let filmFormatter = FilmFormatter()
    
    var router = Router<CinemaRoute>()
    
    func buildRoot() -> some View {
        CinemaList()
            .environment(\.cinemaRouter, router)
            .environment(\.cinemaStore, cinemaStore)
            .navigationDestination(for: CinemaRoute.self) {[weak self] value in
                self?.build(route: value)
            }
    }
    
    @ViewBuilder
    func build(route: CinemaRoute) -> some View {
        switch route {
        case .details(let cinema): 
            CinemaDetailView(cinema: cinema)
                .environment(\.cinemaRouter, router)
                .environment(\.filmFormatter, filmFormatter)
                .environment(\.filmStore, filmStore)
        case .booking(let film):
            FilmBookingView(film: film)
                .environment(BookingSession(film: film))
        }
    }
}
