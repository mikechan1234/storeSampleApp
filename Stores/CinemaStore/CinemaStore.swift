import SwiftUI
import Observation

@Observable
class CinemaStore {
    var cinemas: [Cinema] = []
    
    @ObservationIgnored 
    private let cinemaFetcher: CinemaFetchable
    
    init(cinemaFetcher: CinemaFetchable) {
        self.cinemaFetcher = cinemaFetcher
    }
    
    func getCinemas() async throws {
        cinemas = try await cinemaFetcher.cinema()
    }
}

extension EnvironmentValues {
    var cinemaStore: CinemaStore {
        get { self[CinemaStoreKey.self] }
        set { self[CinemaStoreKey.self] = newValue }
    }
}

private struct CinemaStoreKey: EnvironmentKey {
    static var defaultValue: CinemaStore = CinemaStore(cinemaFetcher: CinemaRepository(decoder: JSONDecoder()))    
}
