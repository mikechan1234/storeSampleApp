import SwiftUI

struct FilmList: View {
    @Environment(\.filmStore) var filmStore
    let cinemaId: String
    var body: some View {
        Section { 
            List(filmStore.films[cinemaId] ?? []) { film in
                FilmListCell(film: film)           
            }
            .listStyle(.plain)      
        } header: { 
            FilmListSectionHeader()
        }
        .task {
            do {
                try await filmStore.filmsNowShowing(at: cinemaId)
            } catch {
                print("films showing at failed")
            }
        }
    }
}

#Preview {
    FilmList(cinemaId: "123")
        .environment(\.filmStore, FilmStore(filmFetcher: FilmRepository()))
        .environment(Router<CinemaRoute>())
//        .environmentObject(Router<CinemaRoute>())
}
