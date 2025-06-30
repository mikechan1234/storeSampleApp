import Observation
import SwiftUI

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
    @Entry var cinemaStore = CinemaStore(cinemaFetcher: CinemaRepository(decoder: JSONDecoder()))
}
