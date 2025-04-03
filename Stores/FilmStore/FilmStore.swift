import Observation
import SwiftUI

@Observable
class FilmStore {
    var films: [String: [Film]] = [:]
    @ObservationIgnored
    private let filmFetcher: FilmFetchable
    
    init(filmFetcher: FilmFetchable) {
        self.filmFetcher = filmFetcher
    }
    
    func filmsNowShowing(at cinemaID: String) async throws {
        films[cinemaID] = try await filmFetcher.getFilms(at: cinemaID)
    }
}

extension EnvironmentValues {
    var filmStore: FilmStore {
        get { self[FilmStoreKey.self] }
        set { self[FilmStoreKey.self] = newValue }
    }
}

private struct FilmStoreKey: EnvironmentKey {
    static var defaultValue: FilmStore = FilmStore(filmFetcher: FilmRepository())    
}
