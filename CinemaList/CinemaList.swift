import SwiftUI

struct CinemaList: View {
    @Environment(\.cinemaStore) private var cinemaStore
    
    var body: some View {
        List(cinemaStore.cinemas) { cinema in
            CinemaListCell(cinema: cinema)
        }
        .listStyle(.plain)
        .task { 
            do {
                try await cinemaStore.getCinemas()   
            } catch {
                print("Get Cinema failed")
            }
        }
        .navigationTitle("Cinemas")
    }
}

#Preview(body: { 
    NavigationStack {
        CinemaList()
            .environment(\.cinemaStore, CinemaStore(cinemaFetcher: CinemaRepository(decoder: JSONDecoder())))
    }
})
